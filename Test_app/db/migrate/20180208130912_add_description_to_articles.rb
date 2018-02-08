class AddDescriptionToArticles < ActiveRecord::Migration
  # Metodo correto para alterar alguma tabela criada
  # rails generate migration add_description_to_articles
  
  def change
    # add_collum :Nome_da_Tabela, :Nome_do_atributo, :tipo_do_atributo
    add_column :articles, :description, :text
    # Para adcionar time stamps
    add_column :articles, :created_at, :datetime # O nome aqui deve ser 'created_at'
    add_column :articles, :updated_at, :datetime # O nome aqui deve ser 'updated_at'
  end
  # Para executar
  # rake db:migrate
end
