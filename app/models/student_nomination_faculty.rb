class StudentNominationFaculty < ActiveRecord::Base
  
  validates :first_name, :last_name, :email,
            :campus_unit_id, presence: true
  validates_uniqueness_of :email

  belongs_to :department, class_name: 'CampusDepartment', foreign_key: 'campus_department_id'
  belongs_to :unit, class_name: 'CampusUnit', foreign_key: 'campus_unit_id'
  has_many :student_nominations
end
