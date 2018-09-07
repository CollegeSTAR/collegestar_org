class ThreeTwoOneVideos::ProposalsController < ApplicationController

  def new
    @proposal = ThreeTwoOneVideoProposal.new  
  end

  def create
    @proposal = ThreeTwoOneVideoProposal.create(proposal_params)
    if @proposal.persisted?
      flash[:notice] = "Successfully submitted proposal."
      redirect_to three_two_one_videos_proposal_confirmation_path(token: @proposal.token)
    else
      flash[:errors] = @proposal.errors.full_messages
      render :new
    end
  end

  private

  def proposal_params
    params.require(:three_two_one_video_proposal).permit(
      :first_name,
      :last_name,
      :email,
      :institution,
      :title,
      :representation,
      :action_expression,
      :engagement,
      :instructional_practice
    )
  end
end
