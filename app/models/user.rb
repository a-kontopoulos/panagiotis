class User < ApplicationRecord

  #rails function to create secure password
  has_secure_password

  attr_accessor :remember_token, :activation_token
  #dowcases the email address
  before_save   :downcase_email
  

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
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
    def User.new_token
      SecureRandom.urlsafe_base64
    end


  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  private

  # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end


end
