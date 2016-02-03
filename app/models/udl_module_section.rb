class UdlModuleSection < ActiveRecord::Base
  has_many :module_section_associations, foreign_key: 'section_id', inverse_of: :section, dependent: :destroy
  has_many :modules, class_name: 'UdlModule', through: :module_section_associations
  
  def position( args={} )
    @position ||= module_section_associations.where( module_id: args[:module].id ).first.section_page_position
  end

  def to_param
    slug
  end

end
