class Article < ActiveRecord::Base
  
  validades :title, presence: true, length: { minimum: 3, maximum: 50 }
  # Garante que exista um titulo antes que seja salvo no banco de dados
  validades :description, presence: false, length: { minimum 10, maximum: 300 }
  
  
end