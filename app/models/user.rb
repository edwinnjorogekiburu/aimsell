class User < ActiveRecord::Base

	attr_accessible :username , :email , :password , :password_confirmation 
 	
 	before_save { |user| user.email = email.downcase }
 	before_save :create_remember_token

 	has_secure_password
	
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def create_remember_token
    # Create the token.
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
