class StarLearningCommunities::RegistrationsController < ApplicationController
  
  def index
    @registrations = StarLearningCommunityRegistration.all
    authorize @registrations
  end

  def new
    @registration = StarLearningCommunityRegistration.new
    authorize @registration
  end

  def show
    @registration = StarLearningCommunityRegistration.find( params[:id] )
    authorize @registration
  end

  def create
    @registration = StarLearningCommunityRegistration.new( star_learning_community_params )
    authorize @registration
    if @registration.save
      StarLearningCommunityRegistrationMailer.confirmation(@registration).deliver_now
      render 'confirmation'
    else
      render 'new'
    end
  end

  def star_learning_community_params
    params.require(:star_learning_community_registration).permit(
      :first_name, 
      :last_name, 
      :email, 
      :phone,
      :department, 
      :university, 
      :slc, 
      :instructional_practice, 
      :instructional_practice_justification, 
      :udl_representation, 
      :udl_action_expression, 
      :udl_engagement, 
      :network_established
    )
  end
end
