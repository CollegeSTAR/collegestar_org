class UdlModuleSection < ActiveRecord::Base
  validates :title, presence: true
  validate :parent_is_a_udl_module_page
  has_many :module_section_associations, foreign_key: 'section_id', inverse_of: :section, dependent: :destroy
  has_many :modules, class_name: 'UdlModule', through: :module_section_associations
  
  def position( args={} )
    @position ||= module_section_associations.where( module_id: args[:module].id ).first.section_page_position
  end

  def self.shared_sections
    result = {}
    UdlModule::PAGES.each do |page|
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

  def self.find_module_section( args={} )
    self.joins(:modules)
      .where("udl_modules.slug = ? and udl_module_sections.slug = ?", args[:module_slug], args[:section_slug]).first
  end

  def to_param
    slug
  end

  def parent_is_a_udl_module_page
    unless UdlModule::PAGES.include? self.parent.to_sym
      errors.add(:parent, "Must be a page from a UDL Module") 
    end
  end
end
