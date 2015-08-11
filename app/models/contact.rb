class Contact
  include ActiveModel::Validations
  attr_accessor :name, :email, :subject, :message, :send_copy, :mailer, :template
   
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :subject, presence: true
  validates :message, presence: true
end
