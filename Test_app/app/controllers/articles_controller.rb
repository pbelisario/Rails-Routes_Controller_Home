class ArticlesController < ApplicationController
  def new 
    @article = Article.new
  end
  
  def create
    # Renderiza o que a variavel :articles recebeu
    # render plain: params[:article].inspect
    
    # Cria uma variacel que recebera os parametros
    @article = Article.new(article_params)
    
    # Testa se e' salvavel no BD
    if @article.save
      # Cria PopUp
      # Para permitir que ela apareca tem que colocar um
      # codigo em views/layouts application.html.erb
      flash[:notice] = "Article was successfully created"
      # Redireciona a pagina atual
      # para a pagina 'article/show'
      # TEM UM POSSIVEL ERRO AQUI
      redirect_to article_path(@article)
    else
      # Renderiza a pagina new novamente
      render 'new'
    end
  end
  
  def show
    # Mostrara' o Article correspondente ao id que estara' na pagina
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      # Auto explicativo
      # O unico parametro aceito e' o :article,
      # e dele somente as variaveis aceitas
      # sao :title, e :description
      params.require(:article).permit(:title,:description)
    end
  
  
end