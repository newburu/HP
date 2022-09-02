class ArticlesController < ApplicationController
  def index
    @articles = Article.where(status: "published").order(created_at: :desc)
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(7)
    @articles_per_month = Article.group("strftime('%Y年%m月', created_at)").count
  end

  def show
    @article = Article.find(params[:id])
  end
end
