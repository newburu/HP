class Admin::ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end
end

def create
  article = Article.create! params.require(:article).permit(:title, :content)
end

def article_params
  params.require(:article).permit(:title, :content)
end
