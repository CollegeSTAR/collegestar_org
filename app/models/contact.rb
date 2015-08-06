class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :subject, :message, :send_copy

  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :message, presence: true

  def send_email
    #email message
  end
end
