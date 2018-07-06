class NullUser < User

  attr_reader :email

  def initialize(args)
    super(args)
    @email = ""
  end

  def authenticate( password )
    false
  end
  
  def has_roles?( requested_roles )
    false
  end

  def generate_password_reset
    false
  end

  def module_histories
    return NullUserModuleHistory.new
  end

  def find_module_history(args={})
    return NullUserModuleHistory.new
  end
end
