class StarLearningCommunityRegistrationMailer < ApplicationMailer
  
  def confirmation(registration)
    @registration = registration
    @subject = "College STAR Learning Community Request Received"
    @admin_email = "WATSONR16@ECU.EDU"
    mail(
      to: @registration.email,
      bcc: @admin_email,
      subject: @subject
    )
  end
end
