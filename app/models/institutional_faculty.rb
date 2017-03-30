class InstitutionalFaculty < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email

  belongs_to :campus
  has_many :department_faculty_associations, dependent: :destroy
  has_many :faculty_course_associations, dependent: :destroy
  has_many :courses, through: :faculty_course_associations, source: :institutional_course
  has_many :faculty_nomination_surveys
end
