class ContactsController < ApplicationController
  # before_action :set_contact_params, only: [:confirm]

  def new
    @contact = Contact.new
  end
  
  def calendar
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    session[:name] = params[:contact][:name]
    session[:name_hiragana] = params[:contact][:name_hiragana]
    session[:email] = params[:contact][:email]
    session[:matter] = params[:contact][:matter_text]
    session[:menu] = params[:contact][:menu_text]
    session[:discount] = params[:contact][:discount_text]
    session[:payment] = params[:contact][:payment_text]
    session[:content] = params[:contact][:content]
  end

  def reservation
    @day = params[:day]
    @time = params[:time]
    # render :new if @contact.invalid?
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    session[:name]
    session[:name_hiragana]
    session[:email]
    session[:matter]
    session[:menu]
    session[:discount]
    session[:payment]
    session[:content]
    # render :new if @contact.invalid?
  end

  private

  def reservation_params
    params.permit(:day, :time, :start_time)
  end
end
