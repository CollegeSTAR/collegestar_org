class DssContactsController < ApplicationController
  before_action :set_dss_contact, only: [:show, :edit, :update, :destroy]

  def index
    @community_college_dss_contacts = DssContact.community_college
    @unc_dss_contacts = DssContact.unc
    @private_college_dss_contacts = DssContact.private_college
  end

  def show
  end

  def edit
    authorize @dss_contact
  end

  def update
    authorize @dss_contact
    @dss_contact.update( update_dss_contact_params )
    redirect_to dss_contact_path( @dss_contact ), notice: 'Successfully updated DSS contact.'
  end

  def new
    @dss_contact = DssContact.new
    authorize @dss_contact
  end

  def create
    @dss_contact = DssContact.new( dss_contact_params )
    authorize @dss_contact
    @dss_contact.slug = @dss_contact.campus_name.parameterize
    if @dss_contact.save
      redirect_to dss_contact_path( @dss_contact ), notice: 'Successfully created DSS contact.'
    else
      render :new
    end
  end

  def destroy
    authorize @dss_contact
    @dss_contact.destroy
    redirect_to dss_contacts_path, notice: 'Successfully deleted DSS contact.'
  end

  private

  def set_dss_contact
    @dss_contact = DssContact.find_by slug: params[:slug]
  end

  def update_dss_contact_params
    params.require(:dss_contact).permit(
     :dss_office, 
     :description_of_services, 
     :contact_person, 
     :contact_email, 
     :contact_phone_number,
     :dss_website
    )
  end

  def dss_contact_params
    params.require(:dss_contact).permit(
      :institution_type, 
      :campus_name, 
      :dss_office, 
      :description_of_services, 
      :contact_person, 
      :contact_email, 
      :contact_phone_number,
      :dss_website
    )
  end
end
