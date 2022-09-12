class ArticlesController < ApplicationController
  def index
    @articles = Article.where(status: "published").order(created_at: :desc)
    @articles_per_months = @articles.group_by(&:created_ym)
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(7)
  end

  def show
    @article = Article.find(params[:id])
  end
end
