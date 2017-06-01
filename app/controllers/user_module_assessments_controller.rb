class UserModuleAssessmentsController < ApplicationController

  def create
    result = CreateModuleAssessment.call( user: current_user, 
                                          submitted_params: user_module_assessment_params,
                                          assessment: UserModuleAssessment.new
                                        )
    @user_module_assessment = result.assessment
  end

  private

  def user_module_assessment_params
    params.require(:user_module_assessment).permit(:module_id, :questions_order, selected_answer_choices: {}) 
  end
end
