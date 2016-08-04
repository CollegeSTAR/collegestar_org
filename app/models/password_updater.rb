class PasswordUpdater
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming
  
  attr_reader :errors
  attr_accessor :current_password, :new_password, :new_password_confirmation

  def initialize( args={} )
    @current_password = args.fetch(:current_password, nil)
    @new_password = args.fetch(:new_password, nil)
    @new_password_confirmation = args.fetch(:new_password_confirmation, nil)

    @errors = ActiveModel::Errors.new(self)
  end

  def update_password( user )
    if user.authenticate( @current_password ) 
      update_user user
      return true if  @errors.empty?
    end
    false
  end

  def persisted?
    false
  end

  private

  def update_user( user )
    user.password = @new_password
    user.password_confirmation = @new_password_confirmation
    if user.save
      return true
    else
      @errors = user.errors
    end
    false
  end
end
