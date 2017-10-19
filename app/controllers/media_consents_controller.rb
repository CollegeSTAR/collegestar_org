class MediaConsentsController < ApplicationController
  before_action :set_media_consent, only: [:show]

  def index
    @media_consents = MediaConsent.all
    authorize @media_consents
  end

  def show
    authorize @media_consent
  end

  def new
    @media_consent = MediaConsent.new
    authorize @media_consent
  end

  def create
    @media_consent = MediaConsent.new( media_consent_params )
    authorize @media_consent
    if (@media_consent.save)
      redirect_to student_support_summit_path, notice: 'Successfully submitted media consent, thank you!'
    else
      flash[:error] = 'There was an error submitting your media, consent, please try again.'
      render :new 
    end
  end

  private

  def set_media_consent
    @media_consent = MediaConsent.find( params[:id] )
  end

  def media_consent_params
    params.require(:media_consent).permit(:first_name, :last_name, :image, :consent)
  end

  def user_not_authorized
    flash[:errors] = "You are not authorized to perform this action."
    redirect_to student_support_summit_path
  end
end
