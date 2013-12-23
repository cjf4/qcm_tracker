def client_attributes(overrides = {})
	{
		username: "JoeSchmoe",
		company: "Super Schmoe Mo",
		email: "joeys@superschmoemo.com"
	}.merge(overrides)
end 