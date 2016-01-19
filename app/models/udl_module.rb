class UdlModule < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  has_many :module_author_associations, foreign_key: 'module_id'
  has_many :module_faculty_associations, foreign_key: 'module_id'
  has_many :module_section_associations, foreign_key: 'module_id'
  has_many :authors, through: :module_author_associations, class_name: "User"
  has_many :faculty, through: :module_faculty_associations, class_name: "User"
  has_many :sections, through: :module_section_associations, class_name: 'UdlModuleSection'

  def get_sections_by_page(page)
    page_sections = []
    sections.each do | section|
      page_sections << section if section.parent == page.to_s.downcase
    end
    page_sections.sort { |section_one, section_two| section_one.position <=> section_two.position }
  end

  def get_page_section_count( page )
    
  end

  def to_param
    slug
  end
end
