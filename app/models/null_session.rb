class NullSession < Session
  def initialize
    @permanent = nil
    @auth_token = nil
  end

  def persist(cookies)
  end

  def destroy(cookies)
  end
end
