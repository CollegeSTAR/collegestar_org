class DigestModuleAssessment
  include Interactor

  def call
    context.assessment.user = context.user
    context.assessment.udl_module_id = context.submitted_params[:module_id] 
    context.assessment.questions_order = context.submitted_params[:questions_order]
    if build_question_associations
      context.assessment.save
    else
      context.fail
    end
  end

  private

  def build_question_associations
    JSON.parse(context.submitted_params[:questions_order]).each do |position, question|
      context.assessment.user_assessment_question_associations.build( 
        user_module_assessment: context.assessment, 
        assessment_question_id: question["id"],
        position: position,
        answer_choices: question["answer_choices"].to_json,
        selected_answer_id: context.submitted_params[:selected_answer_choices][question["id"].to_s]
      )
    end
  end
end
