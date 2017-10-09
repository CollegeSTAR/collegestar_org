class UdlModule < ActiveRecord::Base
  
  PAGES = [
    :introduction,
    :module_objectives,
    :udl_alignment, 
    :instructional_practice, 
    :literature_base, 
    :learn_more, 
    :references,
    :resources,
    :about_the_author
  ]
  
  before_validation :generate_slug
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  has_attached_file :title_image, styles: { medium: "250x150", thumb: "100x60" }
  validates_attachment_content_type :title_image, content_type: /\Aimage\/.*\z/

  has_many :module_author_associations, foreign_key: 'module_id', inverse_of: :module, dependent: :destroy
  has_many :module_faculty_associations, foreign_key: 'module_id', inverse_of: :module, dependent: :destroy
  has_many :module_section_associations, foreign_key: 'module_id', inverse_of: :module, dependent: :destroy
  has_many :authors, through: :module_author_associations, class_name: "User"
  has_many :faculty, through: :module_faculty_associations, class_name: "User"
  has_many :sections, -> { order 'module_section_associations.section_page_position ASC' }, through: :module_section_associations, class_name: 'UdlModuleSection'
  has_many :assessment_questions, -> { order(created_at: :asc) }, dependent: :destroy
  
  scope :released, -> { where(released: true).order(:title) }
  scope :unreleased, -> { (where released: false).order(:title) }

  accepts_nested_attributes_for :assessment_questions

  def initialize(attributes={})
    super
  end

  #  Fixme: Learn more about Association Extensions and figure out if that will fix
  #  the position setting issue.
  #  Use this to also set the section position on the module_section_association
  #  Currently, using udl_module.sections.build will not set a section_page_position
  #  on the module/section association. This is a hack, but it'll have to do for now.
  def add_section(section)
    section.save
    if section.shared
      section_position = section.default_shared_position
    else
      section_count = get_page_section_count( section.parent )
      section_position = section_count + 1

    end
    section.module_section_associations.create(
      module_id: id,
      section_page_position: section_position
    )
    reload
  end

  def get_sections_by_page(page)
    sections.where( "parent = ?", page ).order( 'module_section_associations.section_page_position ASC' )
  end

  def get_page_section_count( page )
    sections.where( "parent = ?", page ).count
  end

  def to_param
    slug
  end

  private

  def generate_slug
    if self.slug.nil? && self.title
      self.slug = self.title.parameterize
    end
  end
end
