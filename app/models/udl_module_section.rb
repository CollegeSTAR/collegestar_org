class UdlModuleSection < ActiveRecord::Base
  has_many :module_section_associations, foreign_key: 'section_id'
  has_many :modules, class_name: 'UdlModule', through: :module_section_associations

  def set_position( parent_module )
    parent_module.get_page_section_count( parent )  
  end

  def to_param
    slug
  end
end
