class VirtualConferenceMailer < ApplicationMailer
  def proposal_confirmation(proposal_id)
    @proposal = VirtualConferenceProposal.find proposal_id

    mail(
      to: @proposal.email,
      subject: "College STAR Virtual Conference Proposal Received!"
    )
  end
end
