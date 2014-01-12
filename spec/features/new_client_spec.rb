require 'spec_helper'

describe "create client page" do
	subject { page }
	before { visit new_client_path }

	let(:submit) 	{ "Create New Client"}

	describe "with invalid information" do
		it "should not create a new client" do
			expect { click_button submit}.not_to change(Client, :count)
		end
	end

	describe "with valid information" do
		before do
			fill_in "Username",         with: "Example User"
      fill_in "Email",        with: "user@example.com"
     	fill_in "Company",			with: "Example Corp"
      fill_in "Password",     with: "foobar"
      fill_in "Confirm Password", with: "foobar"
    end

		it "should create a client" do
			expect { click_button submit }.to change(Client, :count).by(1)
		end 
	end
end
