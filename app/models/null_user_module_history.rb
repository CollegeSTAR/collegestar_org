class NullUserModuleHistory
  def touch
    return true
  end

  def find_or_create_by(args={})
     return self
  end
end
