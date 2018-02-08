class CreateArticles < ActiveRecord::Migration
  # Esse arquivo e' gerado por meio do comando
  # rails generate migration NOME_DO_ARQUIVO sem adicionar o formato
  
  # Para execulata-lo
  # rails db:migrate PARA RUBY 5 ou superior
  # rake db:migrate PARA RUBY ANTERIOR AO 5
  # Deve-se executa-lo após fazer as adições necessárias
  
  # Se apos executar esse arquivo achar um erro
  # rake db:rollback
  # Desfaz o que acabou de ser criado
  # NÃO É O MODO MAIS ADEQUADO !!!
  def change
    create_table :articles do |t|
      t.string :title # cria um titulo
      # t.text :description # uma forma de se adicionar uma descriçao
    end
  end
end
