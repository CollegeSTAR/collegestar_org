class FacultyCourseAssociation < ActiveRecord::Base
  belongs_to :institutional_faculty
  belongs_to :institutional_course
end
