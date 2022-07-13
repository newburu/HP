class ContactsController < ApplicationController
  def new
    @contact = Contact.new  
  end
  
  def calendar
    @contact = Contact.new(contact_params)
    render 'new' if @contact.invalid?
    @reservations = Reservation.all.where('day >= ?', Date.current)
    session[:contact] = params[:contact]
  end

  def reservation
    @day = params[:day]
    @time = params[:time]
    @reservation = Reservation.new
    if @day.to_date <= Date.today
      redirect_to new_contacts_path, alert: '過去の日付が入力されたので、最初からやり直してください'
    end
  end
             
  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.contact = Contact.new(session[:contact])
  end

  def create
    @reservation = Reservation.new(contact_reservation_params)
    if @reservation.save
      redirect_to finish_contacts_path
    else
      redirect_to new_contacts_path, alert: '何らかのエラーが発生しました。申し訳ございませんが、内容をご確認の上最初からやり直してください。'
    end
  end

  def finish
  end

  private
  
  def contact_params
    params.require(:contact).permit(:name, :name_hiragana, :email, :matter, :menu, :discount, :payment, :content)
  end

  def reservation_params
    params.require(:reservation).permit(:day, :time)
  end

  def contact_reservation_params
    params.require(:reservation).permit(
      :day, :time,
      contact_attributes: [
        :name, :name_hiragana, :email, :matter, :menu, :discount, :payment, :content,
    ])
  end
end
