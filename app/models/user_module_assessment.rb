class UserModuleAssessment < ActiveRecord::Base
  validates :questions_order, :user, :udl_module, presence: true

  belongs_to :user
  belongs_to :udl_module
  belongs_to :user_module_history
  has_many :user_assessment_question_associations, -> { order("position") }
  has_many :questions,
           through: :user_assessment_question_associations, 
           source: :assessment_question

  def passed?
    return true if score.to_i >= 80
    return false
  end
end
