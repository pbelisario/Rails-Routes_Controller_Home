class Article < ActiveRecord::Base
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  # Garante que exista um titulo antes que seja salvo no banco de dados
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  
  
end