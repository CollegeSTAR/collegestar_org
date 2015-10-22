class User < ActiveRecord::Base
  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: true, email: true
  validates :password,
              presence: { on: :create },
              length: { minimum: 8 }, 
              allow_nil: true
  validates :password_confirmation, presence: { on: :create }
  has_secure_password

  has_many :access_controls
  has_many :roles, through: :access_controls
  has_many :modules_authors, foreign_key: 'author_id'
  has_many :author_modules, class_name: 'UdlModule', through: :modules_authors
  has_many :modules_contributing_faculty, foreign_key: 'contributing_faculty_id'
  has_many :faculty_modules, class_name: 'UdlModule', through: :modules_contributing_faculty

  before_create do 
    generate_token(:auth_token)
    generate_token(:activation_token)
  end
  
  # Return a NullUser object if an object cannot be found.
  def self.guaranteed_find_by(args = {})
    if user = User.find_by( args )
      return user
    end
    return NullUser.new
  end

  def self.guaranteed_find( id )
    if user = User.find(id)
      return user
    end
    return NullUser.new
  end

  def admin?
    return false
  end

  def generate_abilities(ability)
    roles.each do |role|
      role.apply_abilities ability
    end
  end

  def generate_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save
  end

  def reset_password(args)
    self.password = args[:password]
    # we need a failing validation if confirmation is not set. "t" is not a valid password.
    self.password_confirmation = args.fetch(:password_confirmation, "t")
    self.password_reset_token = nil
    save
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?( column => self[column] )
  end
end
