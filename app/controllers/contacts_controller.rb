class ContactsController < ApplicationController
  respond_to :html
  before_action :set_contact, only: [:create]
  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    if @contact.valid?
      @contact.send_email
      render :sent
    else
      render :new
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_path, notice: 'Contact was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_contact
      @contact = Contact.new(contact_params)

    end

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message, :send_copy)
    end
end
