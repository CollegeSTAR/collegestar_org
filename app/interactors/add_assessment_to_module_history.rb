class AddAssessmentToModuleHistory
  include Interactor
  
  def call
    context.module_history = context.user.find_module_history_by(udl_module_id: context.assessment.udl_module_id)
    context.module_history.assessments << context.assessment
    context.module_history.assessment_attempted = true if !context.module_history.assessment_attempted
    
    if (context.assessment.passed? && !context.module_history.assessment_passed)
      context.module_history.assessment_passed = true
    end
  end
end
