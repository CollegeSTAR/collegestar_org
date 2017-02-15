class Session
  attr_reader :auth_token, :permanent
 
  def self.create(args)
    user = User.guaranteed_find_by email: args[:email].downcase
    if user.authenticate( args[:password] )
      return Session.new auth_token: user.auth_token, permanent: args.fetch(:permanent, false)
    else
      return NullSession.new
    end
  end
  
  def initialize(args)
    @auth_token = args.fetch(:auth_token, nil)
    @permanent = args.fetch(:permanent, false)
  end

  def persist( cookies )
    if @permanent && @auth_token
      cookies.permanent[:auth_token] = @auth_token
    else 
      cookies[:auth_token] = @auth_token
    end
  end

  def self.destroy( cookies )
    cookies.delete( :auth_token )
  end
end
