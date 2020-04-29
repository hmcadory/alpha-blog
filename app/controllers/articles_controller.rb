class ArticlesController < ApplicationController
  def show
#    byebug
    @article = Article.find(params[:id])
  end

  def index
    @article = Article.all
  end

  def new

  end

  def create
    # You must whitelist the fields that you are allowing to be returned - a security feature
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    redirect_to @article
  end
end