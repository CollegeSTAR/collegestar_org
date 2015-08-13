class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :subject, :message, :send_copy, :mailer, :template
   
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :subject, presence: true
  validates :message, presence: true

  def add_recipient(recipients)
    recipients << email if send_copy == 1
    recipients
  end
end
