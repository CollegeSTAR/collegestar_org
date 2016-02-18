class UdlModuleSection < ActiveRecord::Base
  has_many :module_section_associations, foreign_key: 'section_id', inverse_of: :section, dependent: :destroy
  has_many :modules, class_name: 'UdlModule', through: :module_section_associations
  
  def position( args={} )
    @position ||= module_section_associations.where( module_id: args[:module].id ).first.section_page_position
  end

  def self.shared_sections
    result = {}
    [:introduction, :udl_principles, :instructional_practice, :literature_base, :learn_more, :references_and_resources].each do |page|
      result[page] = self.where("shared = ? AND parent = ?", true, page.to_s)
    end
    result
  end

  def self.set_shared_section_default_position( args={} )
    section = args[:section]
    shared_section_count = self.where("shared = ? AND parent = ?", true, section.parent).count
    shared_section_count += 1
    section.default_shared_position = shared_section_count
  end

  def to_param
    slug
  end

end
