class FacultyNominationSurvey < ActiveRecord::Base
  validates :teaching_strategy, :strategy_description, :reasons_for_effectiveness, presence: true

  belongs_to :institutional_faculty
end
