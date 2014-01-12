require 'spec_helper'

describe "Viewing the home page" do
  before { visit "/" } 
  it "displays QCM Tracker" do
  	expect(page).to have_text("Queen City Media")
  end

  it "should have the right title" do
  	expect(page).to have_title("QCM")
  end

  it "should have a link to QCMNY home page" do
  	expect(page).to have_link("QCM Home Page")
  end

  it "should have a signin link" do
    expect(page).to have_link("Sign in to your account")
  end


  describe "when the client is signed in" do
    let(:client) { FactoryGirl.create(:client) }
    before { visit signin_path }
    
    before do
      fill_in "Email",    with: client.email.upcase
      fill_in "Password", with: client.password
      click_button "Sign in"
    end

    describe "typing in the root url" do
      it "should show the clients home page" do
        visit root_path
        expect(page).to have_title(client.company)
      end
    end
  end
end