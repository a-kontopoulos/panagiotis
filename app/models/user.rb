class User < ApplicationRecord


  #rails function to create secure password
  has_secure_password

  #constant for valid email regex
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #validations for user's email
  validates :email,
  #ensures that user enters an email
  presence: true,
  #ensures that its length is max 255 characters
  length: { maximum: 255},
  #ensures that user has entered a valid email format
  format: { with: VALID_EMAIL_REGEX },
  #ensure the is one unique email in the database
  uniqueness: true

  #ensures password is present and has a minimum of 9 characters
  validates :password,
   presence: true,
   length: { minimum: 9 }

  #saves email in lowercase and validates it
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
end
