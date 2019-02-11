class UserModuleAssessmentsController < ApplicationController
  before_action :set_assessment_and_udl_module, only: [:show]

  def create
    result = GradeModuleAssessment.call( 
                                         user: current_user, 
                                         assessment_question_klass: AssessmentQuestion,
                                         submitted_params: user_module_assessment_params,
                                         assessment: UserModuleAssessment.new
                                       )
    if result.success?
      redirect_to(
        profile_user_module_history_assessment_path(
          profile_id: current_user.id,
          user_module_history_id: result.module_history.id,
          id: result.assessment.id
        ),
        notice: "Assessment saved successfully."
      )
    end
  end

  def show
    authorize( @assessment )
    result = ParseUserModuleAssessmentResult.call( assessment: @assessment )
    @score = result.score
    @questions = result.questions
  end

  private
  
  def set_assessment_and_udl_module
    @assessment = UserModuleAssessment.includes(:udl_module).find(params[:id])
    @udl_module = @assessment.udl_module
  end

  def user_module_assessment_params
    params.require(:user_module_assessment).permit(:module_id, :questions_order, selected_answer_choices: {}) 
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to view this assessment."
    redirect_to(profile_user_module_history_path(profile_id: current_user.id, id: params[:user_module_history_id]))
  end
end
