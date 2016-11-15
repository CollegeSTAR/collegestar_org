class SessionsController < ApplicationController
  def new
  end

  def create
    create_session(
      email: params[:email], 
      password: params[:password], 
      permanent: params[:remember_me]
    )
    if @session.auth_token
      user_return_to = session[:user_return_to]
      session.delete :user_return_to
      redirect_to( user_return_to || root_url )
    else
      flash.now[:error] = "Incorrect username and/or password, please try again."
      render "new"
    end
  end

  def destroy
    destroy_session
    redirect_to root_url
  end
end
