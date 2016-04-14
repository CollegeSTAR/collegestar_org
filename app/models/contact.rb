class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :subject, :message, :send_copy
  attr_reader :recipients

  def initialize(args={})
    super(args)
    @recipients = []
  end
   
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :subject, presence: true
  validates :message, presence: true

  def send_copy=(value)
    @send_copy = ActiveRecord::Type::Boolean.new.type_cast_from_database(value)
  end

  def add_recipients(recipients=[])
    @recipients << recipients
    @recipients << email if send_copy
    @recipients.flatten!
  end
end
