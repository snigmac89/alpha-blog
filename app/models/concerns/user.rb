class User < ActiveRecord::Base
  has_many :articles
  before_save {self.email = email.downcase}
  before_save {self.username = username.downcase}
 validates :username, presence: true,

  uniqueness: true,

  length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 105 },

  uniqueness: true,

  format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
end
