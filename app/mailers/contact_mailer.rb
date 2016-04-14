class ContactMailer < ApplicationMailer
  DEFAULT_ADDRESS = "web@collegestar.org"  

  def contact_us(contact)
    @contact = contact
    @recipients = [ContactMailer::DEFAULT_ADDRESS]
    @contact.add_recipients(@recipients)

    mail(
      to: @contact.recipients,
      subject: @contact.subject
    )
  end
end
