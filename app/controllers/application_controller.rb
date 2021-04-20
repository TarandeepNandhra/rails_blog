class ApplicationController < ActionController::Base
  # Since index is empty, rails renders the index.html.erb view file by default.
  def index
    # for some reason @articles could not be accessed in index.html.erb
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # Instantiates a new article, but does not save it
  # new will implictily render new.html.erb
  def new
    @article = Article.new
  end

  # Instantiates a new article with title and body and attempts to save it
  # if saved, redirects to the articles page (article_path(article))
  # Otherwise, will display the form again at new.html.erb
  # Important to use redirect_to after mutating db or app state (in this case @article.save)
  def create
    @article = Article.new(article_params)  

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
