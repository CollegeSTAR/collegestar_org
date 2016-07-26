class NullUser < User
  def authenticate( password )
    false
  end
  
  def has_roles?( requested_roles )
    false
  end
end
