class AssessmentQuestion < ActiveRecord::Base
  
  validates :question, presence: true
  has_many :assessment_answer_choices
end
