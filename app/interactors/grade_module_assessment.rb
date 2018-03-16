class GradeModuleAssessment
  include Interactor::Organizer
  
  organize DigestModuleAssessment, CheckModuleAssessmentAnswers, AddAssessmentToModuleHistory
end
