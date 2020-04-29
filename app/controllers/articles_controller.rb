class ArticlesController < ApplicationController
  def show
#    byebug
    @article = Article.find(params[:id])
  end

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # You must whitelist the fields that you are allowing to be returned - a security feature
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to @article
    else
      render 'new'
    end
  end
end