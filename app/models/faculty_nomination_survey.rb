class FacultyNominationSurvey < ActiveRecord::Base
  validates :faculty_first_name, :faculty_last_name, :department_id, 
            :teaching_strategy, :strategy_description, :reasons_for_effectiveness, 
            presence: true

  belongs_to :institutional_faculty
  belongs_to :department, class_name: "InstitutionalDepartment"

  scope :appropriate, -> { where(not_appropriate: false) }
end
