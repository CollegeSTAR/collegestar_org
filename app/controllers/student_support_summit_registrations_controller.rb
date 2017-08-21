class StudentSupportSummitRegistrationsController < ApplicationController
  before_action :set_registration, only: [:show]

  def index
    @registrations = StudentSupportSummitRegistration.order("created_at DESC")
  end

  def show
  end

  def new
    @registration = StudentSupportSummitRegistration.new
  end

  def create
    @registration = StudentSupportSummitRegistration.new( student_support_summit_registration_params )
    if @registration.save
      render :confirmation
    else
      render :new
    end
  end

  private

  def set_registration
    @registration = StudentSupportSummitRegistration.find params[:id]
  end

  def student_support_summit_registration_params
    params.require(:student_support_summit_registration).permit(
      :program_name,
      :contact_name,
      :contact_email,
      :contact_phone,
      :institution,
      :first_attendee_first_name,
      :first_attendee_last_name,
      :first_attendee_email,
      :first_attendee_phone,
      :first_attendee_address,
      :first_attendee_address_2,
      :first_attendee_city,
      :first_attendee_state,
      :first_attendee_zip,
      :first_attendee_arrival_date,
      :first_attendee_departure_date,
      :first_attendee_travel_by,
      :first_attendee_dietary_restrictions,
      :first_attendee_accessability_needs,
      :second_attendee_first_name,
      :second_attendee_last_name,
      :second_attendee_email,
      :second_attendee_phone,
      :second_attendee_address,
      :second_attendee_address_2,
      :second_attendee_city,
      :second_attendee_state,
      :second_attendee_zip,
      :second_attendee_arrival_date,
      :second_attendee_departure_date,
      :second_attendee_travel_by,
      :second_attendee_dietary_restrictions,
      :second_attendee_accessability_needs,
      :second_attendee_dietary_restrictions,
      :second_attendee_accessability_needs
    )
  end
end
