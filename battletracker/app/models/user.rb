class User < ActiveRecord::Base
  has_secure_password
  has_many :characters

  validates :username, presence: true
  # validates :password, length: { minimum: 6 }
end
