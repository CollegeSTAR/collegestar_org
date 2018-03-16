class AddAssessmentToModuleHistory
  include Interactor
  
  def call
    context.module_history = context.user.find_module_history_by(udl_module_id: context.assessment.udl_module_id)
    context.module_history.assessments << context.assessment
  end
end
