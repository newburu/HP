class Admin::HomeController < ApplicationController
  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    if @home.save
      redirect_to new_admin_home_path
    end
  end

  private

  def home_params
    params.require(:home).permit(:url)
  end
end
