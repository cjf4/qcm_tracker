FactoryGirl.define do
	factory :client do
		username			"Some one"
		email					"someone@gmail.com"
		password			"foobar"
		password_confirmation		"foobar"
		company									"Paychex, Inc"
	end
end