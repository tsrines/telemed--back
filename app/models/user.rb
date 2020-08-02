class User < ApplicationRecord
  has_many :favorites
  has_many :searches
  has_many :doctors, through: :favorites

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  has_secure_password
end
