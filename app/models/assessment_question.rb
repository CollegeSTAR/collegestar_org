class AssessmentQuestion < ActiveRecord::Base
  
  validates :question, presence: true

  belongs_to :udl_module
  has_one :correct_answer_choice, class_name: 'AssessmentAnswerChoice'
  has_many :assessment_answer_choices, -> { order( created_at: :desc) }, dependent: :destroy
  has_many :user_assessment_question_associations, dependent: :destroy

  accepts_nested_attributes_for :assessment_answer_choices

  def get_shuffled_answer_choices
    if (!self.ordered)
      return self.assessment_answer_choices.shuffle
    end
    return self.assessment_answer_choices
  end
end
