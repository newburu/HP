class ArticlesController < ApplicationController
  def index
    @articles = Article.where(status: "published").order(created_at: :desc)
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(7)
  end
end
