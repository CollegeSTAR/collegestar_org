class ContactMailer < ApplicationMailer

  def contact_us(args={})
    @page_content = Page.guaranteed_find slug: 'contacts-mailer-contact-us'
    @contact = Contact.new
    @contact.name = args.fetch(:name)
    @contact.email = args.fetch(:email)
    @contact.subject = args.fetch(:subject)
    @contact.message = args.fetch(:message)

    mail(
      to: @contact.email,
      subject: @contact.subject
    )
  end
end
