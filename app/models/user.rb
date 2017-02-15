class User < ActiveRecord::Base
  before_save :prepare_email

  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: true, email: true
  validates :password,
              presence: { on: :create },
              length: { minimum: 8 }, 
              allow_nil: true
  validates :password_confirmation, presence: { on: :create }
  has_secure_password
  
  belongs_to :campus
  has_many :access_controls
  has_many :roles, through: :access_controls, dependent: :delete_all
  has_many :module_author_associations, foreign_key: 'author_id'
  has_many :author_modules, through: :module_author_associations, source: 'module'
  has_many :module_faculty_associations, foreign_key: 'faculty_id'
  has_many :faculty_modules, through: :module_faculty_associations, source: 'module'
  has_many :redesign_summaries

  before_create do 
    generate_token(:auth_token)
    generate_token(:activation_token)
  end
  
  def full_name
    full_name = title ? "#{title} " : ""
    full_name += "#{first_name} #{last_name}"
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

  #  Use this to query the user's roles.
  #  It can accept either 
  #
  def has_role?(requested_roles=[])
    requested_roles = [requested_roles].flatten #if a single role is given we put it in an array to make iteration easier
    self.roles.each do |role|
      if requested_roles.include? role.name.to_sym
        return true
      end
    end
    return false
  end
  
  private

    def prepare_email
      self.email = self.email.downcase
    end
end
