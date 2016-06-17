class FacultyNominationMailer < ApplicationMailer
 
 # def initialize(nomination)
 #   super
 #   @nomination = nomination
 # end

  def faculty_member
    letter_head = Rails.root + "app/assets/images/seal_letter_head.png"
    attachments.inline['seal_letter_head.png'] = File.read(letter_head)
    mail(
      to: "jonesjoe@ecu.edu",
      subject: "Test"
    )    
  end

  def department_chair
  end

  def unit_chair
  end
end
