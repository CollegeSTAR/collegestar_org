class VirtualConferenceProposalsController < ApplicationController
  
  def new
    @proposal = VirtualConferenceProposal.new
  end

  def index
    authorize @proposals = VirtualConferenceProposal.all
  end

  def show
    authorize @proposal = VirtualConferenceProposal.find( params[:id] )
  end

  def create
    @proposal = VirtualConferenceProposal.new( proposal_params )
    if @proposal.save
      VirtualConferenceMailer.proposal_confirmation( @proposal.id ).deliver_later      
      redirect_to virtual_conference_proposal_confirmation_path( token: @proposal.token ), notice: "Virtual Conference Proposal successfully submitted!"
    else
      flash[:alert] = @proposal.errors.full_messages
      render :new
    end
  end

  private

  def proposal_params
    params.require(:virtual_conference_proposal).
      permit(
        :name,
        :email,
        :presentation_theme,
        :presentation_title,
        :presentation_description,
        :presentation_takeaway
      )
  end
end
