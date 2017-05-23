class UserAssessmentSelectedAnswerChoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :udl_module
  belongs_to :assessment_answer_choice
end
