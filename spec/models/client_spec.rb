require 'spec_helper'

describe "A client" do
	before do
		@client = Client.new(username: "JoeSchmoe", email: "joeschmoe@gmail.com",
													password: "foobar", password_confirmation: "foobar",
													company: "The Pumpery")
	end

	subject { @client }

	it { should respond_to(:username)	}
	it { should respond_to(:email) }
	it { should respond_to(:password_digest)	}
	it { should respond_to(:password)	}
	it { should respond_to(:password_confirmation)	}
	it { should respond_to(:authenticate)	}
	
	it { should be_valid }

	describe "when name is too long" do
		longname = "a" * 50
		client = Client.new(username: longname)
		it "should not be valid" do
			expect(client.valid?).to be_false
		end
	end

	describe "when username format is invalid" do
		client = Client.new(username: "Frank Boy")
		it "should not be valid" do
			expect(client.valid?).to be_false
		end
	end

	describe "when username is already taken" do
		before do
			client_with_same_username = @client.dup
			client_with_same_username.save
		end

		it { should_not be_valid}
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
      client_with_same_email = @client.dup
      client_with_same_email.email = @client.email.upcase
      client_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
  	before do 
  		@client = Client.new(username: "ExampleUser", email: "user@example.com",
  													password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid	}
  end

  describe "when password doesn't match confirmation" do
  	before { @client.password_confirmation = "somethingelse"}
  	it { should_not be_valid	}
  end

  describe "return value of authenticate method" do
  	before { @client.save }
  	let(:found_client) { Client.find_by(email: @client.email )	}

  	describe "with valid password" do
  		it { should eq found_client.authenticate(@client.password)	}
  	end

  	describe "with invalid password" do
  		let(:client_for_invalid_password) { found_user.authenticate("invalid")	}
  	end
  end

end