class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_parameter)
    if @article.save
      redirect_to admin_articles_path
    else
      render 'new'
    end
  end

  private

  def article_parameter
    params.require(:article).permit(:status, :title, :body)
  end
end
