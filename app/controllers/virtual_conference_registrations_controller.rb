class VirtualConferenceRegistrationsController < ApplicationController

  def index
    authorize @registrations = VirtualConferenceRegistration.all
  end

  def show
    authorize @registration = VirtualConferenceRegistration.find( params[:id] )
  end

  def new
    @registration = VirtualConferenceRegistration.new
  end

  def create
    @registration = VirtualConferenceRegistration.new(registration_params)

    if @registration.save
      VirtualConferenceMailer.registration_confirmation( @registration.id ).deliver_later
      redirect_to virtual_conference_registration_confirmation_path( token: @registration.token ), notice: "Virtual Conference Registration submitted successfully!"
    else
      flash[:alert] = @registration.errors.full_messages
      render :new

    end
  end

  private

  def registration_params
    params.require(:virtual_conference_registration).
      permit(
        :first_name,
        :last_name,
        :email,
        :state,
        :parent,
        :student,
        :education_professional,
        :theme_rank_1,
        :theme_rank_2,
        :theme_rank_3,
        :theme_rank_4,
        :number_of_participants,
        :mailing_list
      )
  end

end
