class Admin::ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to admin_images_path
    end
  end

  private

  def image_params
    params.require(:image).permit(:file, :note)
  end
end
