class UdlModuleSection < ActiveRecord::Base
  has_many :module_section_associations, foreign_key: 'section_id'
  has_many :modules, class_name: 'UdlModule', through: :module_section_associations
end
