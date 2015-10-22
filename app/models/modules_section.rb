class ModulesSection < ActiveRecord::Base
  belongs_to :section_module, class_name: 'UdlModule'
  belongs_to :section, class_name: "UdlModuleSection"
end
