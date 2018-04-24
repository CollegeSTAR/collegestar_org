class ContactMailer < ApplicationMailer

  def contact_us(contact_id)
    @page_content = Page.guaranteed_find slug: 'contacts-mailer-contact-us'
    @contact = Contact.find contact_id
    headers['X-SMTPAPI'] = '{"unique_args": {"category": "contact_us" }}'
    mail(
      to: @contact.email,
      subject: @contact.subject
    )
  end
end
