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

      it { should have_title(client.company) }
      it { should have_link('Projects',    href: client_path(client)) }
      it { should have_link('Account',     href: edit_client_path(client)) }
      it { should have_link('Sign Out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      
      describe "followed by signout" do
        before { click_link "Sign Out" }
        it { should have_link('Sign in to your account') }
      end

      describe "visiting the signin url" do

        before { visit new_session_path }
        it "should redirect back to the client's home page" do
          expect(page).to have_content("Viewing")
        end
      end

      describe "navigating to a different page" do
        
        before { click_link "Account" }

        describe "clicking the Home Button" do

          before { click_link "Projects" }

          it "should send the client to the client dashboard (show)" do
            expect(page).to have_content("Viewing")
          end
        end
      end
    end
  end
end