class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :likes, dependent: :destroy
	has_many :liked_secrets, through: :likes, source: :post

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :password, presence: true, on: :create
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
