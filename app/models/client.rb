class Client < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :username, presence: true, length: { in: 6..40 }
	validates :company, presence: true
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	
	validates :password, length: { minimum: 6 }
	has_secure_password

	def Client.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def Client.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	#here, I'm assigning a 64 char string as a remember token, encrypting it, and saving that encryption to the database
	def create_remember_token
		self.remember_token = Client.encrypt(Client.new_remember_token)
	end
end


