class UserModuleAssessment < ActiveRecord::Base
  validates :questions_order, presence: true

  belongs_to :user
  belongs_to :udl_module
  has_many :user_assessment_answer_choice_associations
  has_many :answers, through: :user_assessment_answer_choice_associations, source: :assessment_answer_choice
end
