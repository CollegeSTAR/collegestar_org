module ControllerHelpers
  def login(cookies)
    @user = create(:user)
    cookies[:auth_token] = @user.auth_token
  end
end
