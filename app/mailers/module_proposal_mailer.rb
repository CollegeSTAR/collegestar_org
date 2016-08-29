class ModuleProposalMailer < ApplicationMailer

  def confirmation(proposal)
    @proposal = proposal
    @subject = "College STAR Module Proposal Received"
    mail(
      to: @proposal.email,
      subject: @subject
    )
  end
end
