class InstitutionalCourse < ActiveRecord::Base

  validates :course_number, :course_name, presence: true
  validates_uniqueness_of :course_number, case_sensitive: false

  belongs_to :campus
  has_many :faculty_course_associations
  has_many :faculty, through: :faculty_course_associations, source: :institutional_faculty
end
