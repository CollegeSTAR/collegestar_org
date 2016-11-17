class AssessmentQuestion < ActiveRecord::Base
  
  validates :question, presence: true

  belongs_to :udl_module
  has_many :assessment_answer_choices
  
end
