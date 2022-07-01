class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def calendar
    @contact = Contact.new(contact_params)
    render 'new' if @contact.invalid?
    @reservations = Reservation.all.where('day >= ?', Date.current)
    session[:name] = params[:contact][:name]
    session[:name_hiragana] = params[:contact][:name_hiragana]
    session[:email] = params[:contact][:email]
    session[:matter] = params[:contact][:matter]
    session[:menu] = params[:contact][:menu]
    session[:discount] = params[:contact][:discount]
    session[:payment] = params[:contact][:payment]
    session[:content] = params[:contact][:content]
  end

  def reservation
    @day = params[:day]
    @time = params[:time]
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
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to finish_contacts_path
    end
  end

  def finish
  end

  private
  
  def contact_params
    params.require(:contact).permit(:name, :name_hiragana, :email, :matter, :menu, :discount, :payment, :content)
  end

  def reservation_params
    params.permit(:day, :time, :start_time)
  end
end
