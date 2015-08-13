class ContactMailer < BaseMandrillMailer
  DEFAULT_ADDRESS = "web@collegestar.org"  

  def contact_us(contact)
    @contact = contact
    @recipients = [ContactMailer::DEFAULT_ADDRESS]
    merge_vars = {
      "sender_name" => contact.name,
      "sender_email" => contact.email,
      "message" => contact.message
    }
    @recipients = @contact.add_recipient(@recipients)
    body = mandrill_template( template_name: "contact-us-email", 
                              attributes: merge_vars
                            )
    send_mail( to: @recipients, 
               subject: contact.subject, 
               body: body 
             )
  end
end
