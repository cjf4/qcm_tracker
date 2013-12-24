require 'spec_helper'

describe "A client" do
	before { @client = Client.new(username: "JoeSchmoe", email: "joeschmoe@gmail.com")}

	subject { @client }

	it "should respond to user name" do
		expect(@client).to respond_to(:username)
	end

	it "should respond to password" do
		expect(@client).to respond_to(:password_digest)
	end
	
	it "should be valid" do
		expect(@client).to be_valid
	end

	describe "when name is too long" do
		longname = "a" * 50
		client = Client.new(username: longname)
		it "should not be valid" do
			expect(client.valid?).to be_false
		end
	end

	describe "when email is not present" do
		before { @client.email = "" }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should not be valid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
      	@client.email = invalid_address
      	expect(@client).not_to be_valid
      end
		end
	end

	 describe "when email address is already taken" do
    before do
      user_with_same_email = @client.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      client_with_same_email = @client.dup
      client_with_same_email.email = @client.email.upcase
      client_with_same_email.save
    end

    it { should_not be_valid }
  end
end