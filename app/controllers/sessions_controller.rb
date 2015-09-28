class SessionsController < ApplicationController
  def new
  end

  def create
    @session = Session.create(
      email: params[:email], 
      password: params[:password], 
      permanent: params[:remember_me]
    )
    if @session.auth_token
      persist_session( @session )
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    destroy_session
    redirect_to root_url
  end
end
