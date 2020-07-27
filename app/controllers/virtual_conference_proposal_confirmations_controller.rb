class VirtualConferenceProposalConfirmationsController < ApplicationController

  def show
    @proposal = VirtualConferenceProposal.find_by token: params[:token]
  end

end
