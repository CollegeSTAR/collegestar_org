class UserModuleAssessmentsController < ApplicationController

  def create
    @submitted_params = user_module_assessment_params
  end

  private

  def user_module_assessment_params
    params.require(:user_module_assessment).permit(selected_answer_choices: {}) 
  end
end
