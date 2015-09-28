class PasswordResetMailer < BaseMandrillMailer
  
  def reset_instructions(user)
    @user = user
    @subject = "College STAR password reset instructions"
    merge_vars = {
      "first_name" => @user.first_name,
      "sender_email" => @user.email,
      "reset_url" => edit_password_reset_url(@user.password_reset_token)
    }    
    body = mandrill_template( template_name: "password-reset-instructions", 
                              attributes: merge_vars
                            )
    send_mail( to: @user.email, 
               subject: @subject,
               body: body 
             )
  end

  def reset_confirmation(user)
    @user = user
    merge_vars = {
      "first_name" => @user.first_name,
      "reset_time" => Time.zone.now
    }    
    body = mandrill_template( template_name: "password-reset-confirmation", 
                              attributes: merge_vars
                            )
    send_mail( to: @user.email, 
               subject: "Your College STAR account password has been reset.",
               body: body 
             )
  end
end
