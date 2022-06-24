class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def calendar
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    @contact = Contact.new(contact_params)
  end

  def reservation
    @day = params[:day]
    @time = params[:time]
    @reservation = Reservation.new(reservation_params)
    @contact = Contact.new(contact_params)
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  private

  def contact_params
    params.permit(:name, :name_hiragana, :email, :matter, :menu, :discount, :payment, :content)
  end

  def reservation_params
    params.permit(:day, :time)
  end
end
