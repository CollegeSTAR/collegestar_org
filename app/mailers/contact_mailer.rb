class ContactMailer < ApplicationMailer

  def contact_us(contact_id)
    @page_content = Page.guaranteed_find slug: 'contacts-mailer-contact-us'
    @contact = Contact.find contact_id
    headers['X-SMTPAPI'] = {
      category: "ContactUs",
      unique_args: { contact_id: contact_id }
    }.to_json
    
    mail(
      to: @contact.email,
      subject: @contact.subject
    )
  end
end
