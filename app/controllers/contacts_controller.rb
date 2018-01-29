class ContactsController < ApplicationController
  before_action :set_contact, only: [:show]

  def index
    @contacts = Contact.unread
    authorize @contacts
  end

  def new
    @page_content = Page.guaranteed_find slug: 'contact-us'
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    if @contact.save
      ContactMailer.contact_us(@contact).deliver_now if @contact.send_copy
      redirect_to new_contact_path, notice: "We've received your inquiry and we'll be in touch."
    else
      render :new, notice: "There was a problem sending your email, please try again."
    end
  end

  def show
    authorize @contact
  end

  private
    
    def set_contact
      @contact = Contact.find params[:id]
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message, :send_copy)
    end
end
