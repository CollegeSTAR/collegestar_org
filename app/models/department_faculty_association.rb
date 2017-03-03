class DepartmentFacultyAssociation < ActiveRecord::Base
  belongs_to :department, class_name: "InstitutionalDepartment"
  belongs_to :faculty, class_name: "InstitutionalFaculty"
end
