require 'spec_helper'

describe "Viewing a Client's info page" do
	it "shows the Client's info" do
		client = FactoryGirl.create(:client)

		visit client_url(client)

		expect(page).to have_text(client.username)
		expect(page).to have_text(client.company)
		
	end

	describe "as a different client" do

	end
end