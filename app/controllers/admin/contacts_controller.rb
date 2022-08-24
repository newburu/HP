class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.order(created_at: "desc")
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
