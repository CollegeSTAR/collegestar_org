class StudentNomination < ActiveRecord::Base
  validates :strategy_name, :strategy_description, :strategy_effectiveness, 
            :student_nomination_faculty_id, presence: true

  belongs_to :faculty_member, class_name: 'StudentNominationFaculty', foreign_key: 'student_nomination_faculty_id'
end
