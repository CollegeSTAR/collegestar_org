class CreateModuleAssessment
  include Interactor

  def call
    context.assessment.user = context.user  
    context.assessment.udl_module_id = context.submitted_params[:module_id]
    context.assessment.questions_order = context.submitted_params[:questions_order]
    context.assessment.answer_ids = get_answer_ids
    context.assessment.save
  end

  private

  def get_answer_ids
    context.submitted_params[:selected_answer_choices].values
  end
end
