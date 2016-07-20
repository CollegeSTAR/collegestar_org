class PasswordResetsController < ApplicationController
  before_action :set_user, only: [:edit, :update, :delete]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.find_by(user_params)
    if @user.generate_password_reset
      PasswordResetMailer.reset_instructions(@user).deliver_now
    end
    redirect_to new_password_reset_path, notice: "An email has been sent to the provided email address with reset instructions. Thank you."
  end

  def update
    if @user.reset_password(password_reset_params) 
      PasswordResetMailer.reset_confirmation(@user).deliver_now
      create_session(
        email: @user.email, 
        password: params[:user][:password]
      )
      redirect_to profile_path(@user), notice: "Password updated successfully."
    else
      redirect_to edit_password_reset_path(params[:id]), notice: "Could not update your password, please try again."
    end
  end

  def delete
  end

  private

  def set_user
    @user = User.find_by(password_reset_token: params[:id])
  end

  def user_params
    params.require(:user).permit(:email)  
  end

  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
