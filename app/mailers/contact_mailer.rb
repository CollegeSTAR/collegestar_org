class ContactMailer < ApplicationMailer

  def contact_us(contact)
    @page_content = Page.guaranteed_find slug: 'contacts-mailer-contact-us'
    @contact = contact

    mail(
      to: @contact.email,
      subject: @contact.subject
    )
  end
end
