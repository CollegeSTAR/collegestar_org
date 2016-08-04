class PasswordUpdatesController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_password_updater, only: [:create]

  def create
    if @password_updater.update_password @user
      redirect_to profile_path(@user), notice: "Successfully changed password." 
    else
      redirect_to edit_profile_path(@user), notice: "Unable to change password."
    end
  end

  private

  def set_user
    @user = User.find( params[:user_id] )
  end

  def set_password_updater
    @password_updater = PasswordUpdater.new( password_update_params )
  end

  def password_update_params
    params.require(:password_updater).permit(:current_password, :new_password, :new_password_confirmation)
  end
end
