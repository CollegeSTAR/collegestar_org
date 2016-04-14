class PasswordResetMailer < ApplicationMailer
  
  def reset_instructions(user)
    @user = user
    @subject = "College STAR password reset instructions"
    mail( to: @user.email, 
          subject: @subject
        )
  end

  def reset_confirmation(user)
    @user = user
    mail( to: @user.email, 
          subject: "Your College STAR account password has been reset."
        )
  end
end
