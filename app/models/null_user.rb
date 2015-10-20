class NullUser < User
  def authenticate( password )
    false
  end

  def generate_abilities( ability )
    nil
  end
end
