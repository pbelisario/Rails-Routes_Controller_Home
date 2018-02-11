class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
    # Renderiza o que a variavel :articles recebeu
    # render plain: params[:article].inspect
    
    # Cria uma variacel que recebera os parametros
    @article = Article.new (article_params)
    # A salva no BD
    @article.save
    # Redireciona a pagina atual
    # para a pagina 'articles/show'
    redirect_to articles_show()
  end
  
  private
    def article_params
      # Auto explicativo
      # O unico parametro aceito e' o :article,
      # e dele somente as variaveis aceitas
      # sao :title, e :description
      params.require(:article).permit(:title, :description)
    end
  
  
  
end