require 'spec_helper'

describe 'Authentication' do
	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Sign in') }
		it { should have_title('Sign in')}
	end

	describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error') }
    end

		describe "after visiting another page" do
      before { click_link "Home" }
      it { should_not have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      let(:client) { FactoryGirl.create(:client) }
      before do
        fill_in "Email",    with: client.email.upcase
        fill_in "Password", with: client.password
        click_button "Sign in"
      end
      
      describe "followed by signout" do
        before { click_link "Sign Out" }
        it { should have_link('Sign in to your account') }
      end
    end
  end
end