class UdlModule < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  has_many :module_author_associations, foreign_key: 'module_id'
  has_many :module_faculty_associations, foreign_key: 'module_id'
  has_many :module_section_associations, foreign_key: 'module_id'
  has_many :authors, through: :module_author_associations, class_name: "User"
  has_many :faculty, through: :module_faculty_associations, class_name: "User"
  has_many :sections, through: :module_section_associations, class_name: 'UdlModuleSection'

  def to_param
    slug
  end
end
