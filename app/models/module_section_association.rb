class ModuleSectionAssociation < ActiveRecord::Base
  belongs_to :module, class_name: 'UdlModule'
  belongs_to :section, class_name: "UdlModuleSection"
end
