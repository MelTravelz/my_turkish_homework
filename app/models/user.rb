class User < ApplicationRecord
  has_many :pages

  validates :user_name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password
end