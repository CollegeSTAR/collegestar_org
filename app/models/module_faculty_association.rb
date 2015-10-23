class ModuleFacultyAssociation < ActiveRecord::Base
  belongs_to :module, class_name: 'UdlModule'
  belongs_to :faculty, class_name: 'User'
end
