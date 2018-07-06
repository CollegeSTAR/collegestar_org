class Api::V1::UdlModuleFeedbackController < ApplicationController

  protect_from_forgery execpt: :create
  
  before_action :set_udl_module
  before_action :set_user

  def create
    @udl_module_feedback = UdlModuleFeedback.create(
      udl_module: @udl_module,
      user: @user,
      resource_was_helpful: udl_module_feedback_params[:resource_was_helpful]
    )
    if @udl_module_feedback.persisted?
      message = "Created Module Feedback for #{@udl_module.title}."
      status = :created
    else
      message = @udl_module_feedback.errors.full_messages
      status = :unprocessable_entity
    end


    render json: JSON.generate({message: message}), status: status
  end

  private

  def set_udl_module
    @udl_module = UdlModule.find_by slug: udl_module_feedback_params[:udl_module]
  end

  def set_user
    @user = User.guaranteed_find_by email: udl_module_feedback_params[:user]
  end

  def udl_module_feedback_params
    params.require(:udl_module_feedback).permit(:udl_module, :user, :resource_was_helpful)
  end
end
