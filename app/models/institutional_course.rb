class InstitutionalCourse < ActiveRecord::Base

  validates :course_number, :course_name, presence: true
  validates_uniqueness_of :course_number, case_sensitive: false

  belongs_to :campus
end
