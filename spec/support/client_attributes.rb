def client_attributes(overrides = {})
	{
		username: "JoeSchmoe17",
		company: "The Pumpery",
		email: "joeys@pumpery.com",
		password: "foobar",
		password_confirmation: "foobar"
	}.merge(overrides)
end 