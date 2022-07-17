class HomeController < ApplicationController
  def top
    if Home.present?
      home_id = Home.order(updated_at: :desc).first.id
      @home = Home.find(home_id)
    end 
  end
end
