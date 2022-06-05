class ContactsController < ApplicationController
  def new
    @contact = Contact.new
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
