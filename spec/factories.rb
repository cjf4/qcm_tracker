FactoryGirl.define do
	factory :client do
		username			"Chris Fenton"
		email					"christopherfenton4@gmail.com"
		password			"foobar"
		password_confirmation		"foobar"
		company									"paychex"
	end
end