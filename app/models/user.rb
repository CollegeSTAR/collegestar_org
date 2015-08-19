class User < ActiveRecord::Base
  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, length: { minimum: 8 }, allow_nil: true, confirmation: true
  validates :password_confirmation, presence: true, on: :create
  has_secure_password
  before_create do 
    generate_token(:auth_token)
    generate_token(:activation_token)
  end


  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?( column => self[column] )
  end
end
