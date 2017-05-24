class UserAssessmentAnswerChoiceAssociation < ActiveRecord::Base
  
  belongs_to :user_module_assessment
  belongs_to :assessment_answer_choice
end
