class ApplicationController < ActionController::Base
  # Since index is empty, rails renders the index.html.erb view file by default.
  def index
    # for some reason @articles could not be accessed in index.html.erb
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
