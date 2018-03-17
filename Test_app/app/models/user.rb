class User < ActiveRecord::Base
  
  # Diz que ele pode possuir varios artigos associados à ele
  has_many :articles
  
  # Antes de salvar o email no BD, garante que ele esteja em letra 
  before_save { self.email = email.downcase }
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  
  # Expressão magica que descreve um formato basico de email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  
end