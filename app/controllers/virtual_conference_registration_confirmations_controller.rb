class VirtualConferenceRegistrationConfirmationsController < ApplicationController
  
  def show
    @registration = VirtualConferenceRegistration.find_by token: params[:token]
  end
end
