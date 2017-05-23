class UserModuleAssessment < ActiveRecord::Base
  validates :questions_order, presence: true

  belongs_to :user
  belongs_to :udl_module
  has_many :selected_answer_choices, class_name: "UserAssessmentSelectedAnswerChoice"
end
