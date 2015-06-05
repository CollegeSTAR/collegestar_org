class Campus < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "250x250>", :thumb => "75x75>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: :true
  validates :slug, presence: :true

  def self.find_by_featured(limit = 3)
    campuses = limit(limit)
    campuses = campuses.order(name: :asc)
  end

  def to_param
    slug
  end
end
