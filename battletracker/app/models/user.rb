class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :password, length: { minimum: 6 }
end
