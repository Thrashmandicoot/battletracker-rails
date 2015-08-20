class User < ActiveRecord::Base
  has_secure_password
  has_many :characters
  has_many :campaigns


  validates :username, presence: true
  # validates :password, length: { minimum: 6 }
end
