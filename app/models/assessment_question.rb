class AssessmentQuestion < ActiveRecord::Base
  
  validates :question, presence: true

  belongs_to :udl_module
  has_one :correct_answer_choice, class_name: 'AssessmentAnswerChoice'
  has_many :assessment_answer_choices
  
end
