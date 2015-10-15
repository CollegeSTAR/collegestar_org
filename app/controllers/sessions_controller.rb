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
      redirect_to root_url
    else
      flash.now[:error] = "Incorrect Username and/or password, please try again."
      render "new"
    end
  end

  def destroy
    destroy_session
    redirect_to root_url
  end
end
