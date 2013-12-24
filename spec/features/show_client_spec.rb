require 'spec_helper'

describe "Viewing a Client's info page" do
	it "shows the Client's info" do
		client = Client.create(client_attributes)

		visit client_url(client)

		expect(page).to have_text(client.username)
		expect(page).to have_text(client.company)
		
	end
end