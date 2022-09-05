class Admin::ContactsController < ApplicationController
  before_action :set_contact_info, only:[:show,:update,:edit,:delete]
  def index
    @contacts = Contact&.order(created_at: "desc")
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to edit_admin_contact_path(@contact)
    else
      render 'edit'
    end
  end

  private

  def set_contact_info
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :name_hiragana, :email, :matter, :menu, :discount, :payment, :content)
  end
end
