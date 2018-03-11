class User < ActiveRecord::Base
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, lenght: { minimum: 3, maximum: 25 }
  
  # Expressão magica que descreve um formato basico de email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, lenght: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  
end