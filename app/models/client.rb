class Client < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :username, presence: true, length: { in: 6..25 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
end


