class UdlModuleSection < ActiveRecord::Base
  has_many :modules_sections, foreign_key: 'section_id'
  has_many :section_modules, class_name: 'UdlModule', through: :modules_sections
end
