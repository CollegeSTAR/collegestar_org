class AssessmentAnswerChoice < ActiveRecord::Base
  
  validates_presence_of :text, :position
  belongs_to :assessment_question
end
