class ContactsController < ApplicationController
  respond_to :html
  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.contact_us(@contact).deliver_now
      render :sent
    else
      render :new
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message, :send_copy)
    end
end
