class ThreeTwoOneVideos::ProposalConfirmationsController < ApplicationController
  
  def show
    @proposal = ThreeTwoOneVideoProposal.find_by token: params[:token]
  end
end
