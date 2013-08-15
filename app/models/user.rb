class User < ActiveRecord::Base
  attr_accessible :city, :company, :country, :email, :first_name, :last_name, :phone_m, :phone_o, :state, :street_1, :street_2, :zip, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    # This is preliminary. See "Following users" for the full implementation
    Micropost.where("user_id = ?", id)
  end

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
