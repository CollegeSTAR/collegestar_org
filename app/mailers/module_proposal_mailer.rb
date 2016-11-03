class ModuleProposalMailer < ApplicationMailer

  def confirmation(proposal)
    @proposal = proposal
    @subject = "College STAR Module Proposal Received"
    @admin_email = "WATSONR16@ECU.EDU"
    mail(
      to: @proposal.email,
      bcc: @admin_email,
      subject: @subject
    )
  end
end
