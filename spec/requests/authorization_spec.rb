require 'spec_helper'

describe "authorization" do
	subject { page }

	describe "for non-signed-in clients" do
		let(:client) { FactoryGirl.create(:client) }

		describe "when attempting to visit a protected page" do
			before do
				visit edit_client_path(client)
				fill_in "Email", with: client.email
				fill_in "Password", with: client.password
				click_button "Sign in"
			end

			describe "after signing in" do

				it "should render the desired protected page" do
					expect(page).to have_title('Edit Account')
				end

				
			end
		end


		describe "in the Clients controller" do
				
			describe "visiting the edit page" do
				before { visit edit_client_path(client) }
				it { should have_title('Sign in')}
			end

			describe "submitting to the update action" do
				before { patch client_path(client) }
				specify { expect(response).to redirect_to(signin_path) }
			end					
		end
	end

	describe "as wrong client" do
		let(:client) { FactoryGirl.create(:client)}
		let(:wrong_client) {FactoryGirl.create(:client, email: "wrong@example.com")}
		before { sign_in client, no_capybara: true }

		describe "submitting a GET request to the Clients#edit action" do
			before { get edit_client_path(wrong_client) }
			specify { expect(response.body).not_to match('Edit Client')}
			specify { expect(response).to redirect_to(root_url) }
		end

		describe "submitting a PATCH requrest to the Clients#update action" do
			before { patch client_path(wrong_client) }
			specify { expect(response).to redirect_to(root_url) }
		end
	end
end