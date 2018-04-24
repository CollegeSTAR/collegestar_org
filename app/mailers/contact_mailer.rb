class ContactMailer < ApplicationMailer

  def contact_us(contact_id)
    @page_content = Page.guaranteed_find slug: 'contacts-mailer-contact-us'
    @contact = Contact.find contact_id
    headers({
      'X-SMTPAPI' => JSON.generate({
        unique_args: {
          email_template: 'contact_us'
        }
      }).to_s
    })

    mail(
      to: @contact.email,
      subject: @contact.subject
    )
  end
end
