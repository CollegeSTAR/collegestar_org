class UdlModule < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  has_many :modules_authors, foreign_key: 'author_module_id'
  has_many :modules_contributing_faculty, foreign_key: 'faculty_module_id'
  has_many :modules_sections, foreign_key: 'section_module_id'
  has_many :authors, through: :modules_authors, class_name: "User"
  has_many :contributing_faculty, through: :modules_contributing_faculty, class_name: "User"
  has_many :sections, through: :modules_sections, class_name: 'UdlModuleSection'

  def to_param
    slug
  end
end
