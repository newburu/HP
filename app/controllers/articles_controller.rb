class ArticlesController < ApplicationController
  def index
    @articles = Article.where(status: "published").order(created_at: :desc)
    @articles_per_months = Article.order(created_at: :desc).group("strftime('%Y年%m月', created_at)").count
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(7)
  end

  def show
    @article = Article.find(params[:id])
  end

  def archives
  end
end
