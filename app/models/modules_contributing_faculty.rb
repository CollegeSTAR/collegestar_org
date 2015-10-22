class ModulesContributingFaculty < ActiveRecord::Base
  belongs_to :faculty_module, class_name: 'UdlModule'
  belongs_to :contributing_faculty, class_name: 'User'
end
