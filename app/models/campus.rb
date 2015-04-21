class Campus < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "250x250>", :thumb => "75x75>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :slug

  def to_param
    slug
  end
end
