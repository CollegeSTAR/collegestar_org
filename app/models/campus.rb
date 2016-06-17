class Campus < ActiveRecord::Base
  validates :name, presence: :true, uniqueness: :true
  validates :slug, presence: :true, uniqueness: :true
  validates :abbreviation, presence: :true, uniqueness: :true

  belongs_to :director, class_name: "User"
  has_many :units, class_name: 'CampusUnit'
  has_many :departments, class_name: 'CampusDepartment'

  has_attached_file :image, :styles => { :medium => "250x250>", :thumb => "75x75>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # We instantiate a Null object if director is not set.
  def director
    super || NullCampusDirector.new
  end

  def self.find_by_featured(limit = 3)
    campuses = limit(limit)
    campuses = campuses.order(name: :asc)
  end

  def to_param
    slug
  end
end
