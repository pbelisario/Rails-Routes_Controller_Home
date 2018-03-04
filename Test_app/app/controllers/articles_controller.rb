class ArticlesController < ApplicationController
  
  # Maneira interessante de chamar o mesmo metodo em varias
  # funcoes para evitar repeticao, ressalva-se que esse
  # metodo e' chamado quando a funcao que o utiliza, e' ativada
  before_action :set_article, only: [:update, :show, :destroy]
  
  def index
    # Salva em @articles todos os article presentes
    @articles = Article.all
  end
  
  def new 
    @article = Article.new
  end
  
  def edit
    # Mostrara' o Article correspondente ao id que estara' na pagina
    @article = Article.find(params[:id])
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
      flash[:success] = "Article was successfully created"
      # Redireciona a pagina atual
      # para a pagina 'article/show'
      # TEM UM POSSIVEL ERRO AQUI
      redirect_to(article_path(@article))
    else
      # Renderiza a pagina new novamente
      render 'new'
    end
  end
  
  def update
    

    
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      # A Funcao Redirect_to possui um bug de seguranca
      # Por isso essa linha abaixo nao funciona corretamente
      redirect_to (article_path(@article))
    else
      render 'edit'
    end
    
  end
  
  def show

  end
  
  def destroy

    # O Comando .destroy, tira tambem do BD
    @article.destroy
    
    flash[:danger] = "Article Successfully Deleted"
    redirect_to articles_path
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
  
  
    def article_params
      # Auto explicativo
      # O unico parametro aceito e' o :article,
      # e dele somente as variaveis aceitas
      # sao :title, e :description
      params.require(:article).permit(:title, :description)
    end
  
  
end