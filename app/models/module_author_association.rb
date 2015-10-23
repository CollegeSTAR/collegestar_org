class ModuleAuthorAssociation < ActiveRecord::Base
  belongs_to :module, class_name: 'UdlModule'
  belongs_to :author, class_name: "User"
end
