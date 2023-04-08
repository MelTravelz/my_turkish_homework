class User < ApplicationRecord
  has_many :homeworks

  # validates :user_name, presence: true
  # validates :email, uniqueness: true, presence: true
  # validates :password_digest, presence: true

  # has_secrure_password
end