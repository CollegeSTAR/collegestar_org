class AssessmentQuestion < ActiveRecord::Base
  
  validates :question, presence: true
end
