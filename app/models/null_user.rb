class NullUser < User
  def authenticate( password )
    false
  end
end
