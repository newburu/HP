class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @contacts = Contact.all.where('day >= ?', Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :name_hiragana, :email, :matter, :menu, :discount, :payment, :content)
  end
end
