class VirtualConferenceMailer < ApplicationMailer
  def proposal_confirmation(proposal_id)
    @proposal = VirtualConferenceProposal.find proposal_id

    mail(
      to: @proposal.email,
      subject: "College STAR Virtual Conference Proposal Received!"
    )
  end

  def registration_confirmation(registration_id)
    @registration = VirtualConferenceRegistration.find registration_id

    mail(
      to: @registration.email,
      subject: "College STAR Virtual Conference Registration Confirmation"
    )
  end
end
