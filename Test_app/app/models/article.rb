class Article < ActiveRecord::Base
  
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  # Garante que exista um titulo antes que seja salvo no banco de dados
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
  
  
end