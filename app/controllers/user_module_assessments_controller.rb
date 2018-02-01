class UserModuleAssessmentsController < ApplicationController
  before_action :set_udl_module, only: [:show]
  before_action :set_assessment, only: [:show]

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
          user_module_history_slug: result.assessment.udl_module.slug,
          id: result.assessment.id
        ),
        notice: "Assessment saved successfully."
      )
    end
  end

  def show
    result = ParseUserModuleAssessmentResult.call( assessment: @assessment )
    @score = result.score
    @questions = result.questions
  end

  private
  
  def set_udl_module
    @udl_module = UdlModule.find_by slug: params[:user_module_history_slug]
  end

  def set_assessment
    @assessment = UserModuleAssessment.find params[:id]
  end

  def user_module_assessment_params
    params.require(:user_module_assessment).permit(:module_id, :questions_order, selected_answer_choices: {}) 
  end

end
