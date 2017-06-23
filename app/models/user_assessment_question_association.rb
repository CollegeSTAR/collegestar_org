class UserAssessmentQuestionAssociation < ActiveRecord::Base
  validates :user_module_assessment, :assessment_question, :position, presence: true

  belongs_to :user_module_assessment
  belongs_to :assessment_question
  belongs_to :selected_answer, 
             class_name: "AssessmentAnswerChoice", 
             foreign_key: :selected_answer_id
end
