class StudentSupportSummitRegistrationMailer < ApplicationMailer

  def confirmation(registration)
    @registration = registration
    @subject = "CONFIRMATION: 2017 College STAR Student Support Summit Registration"
    mail(
      to: @registration.contact_email,
      subject: @subject
    )
  end
end
