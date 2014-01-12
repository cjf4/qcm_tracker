require 'spec_helper'

describe "Editing" do
	subject { page }

	let(:client) { FactoryGirl.create(:client) }
	before do
		sign_in client
		visit edit_client_path(client) 
	end

	describe "a client's information page" do
		it { should have_content("Update your account information")}
		it { should have_title("Edit Account") }

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_username) 	{ "New Username" }
			let(:new_email)			{ "new@example.com" }
			let(:new_company)		{ "abc corp"	}
			before do
				fill_in "Username", 				with: new_username
				fill_in "Email",						with: new_email
				fill_in "Company",					with: new_company
				fill_in "Password",					with: client.password
				fill_in "Confirm Password",	with: client.password
				click_button "Save changes"
			end

			it { should have_title(new_company)	}
			it { should have_selector('div.alert.alert-success')	}
			it { should have_link('Sign Out', href: signout_path) }
			specify { expect(client.reload.username).to eq new_username} 
			specify { expect(client.reload.email).to eq new_email}
			specify { expect(client.reload.company).to eq new_company}
		end
	end
end