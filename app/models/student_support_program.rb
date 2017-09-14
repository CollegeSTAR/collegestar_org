class StudentSupportProgram < ActiveRecord::Base
  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true

  has_attached_file :logo, styles: {medium: "250", thumb: "75"}
  validates_attachment :logo, 
                       content_type: { content_type: /\Aimage\/.*\z/ },
                       size: { less_than: 2.megabytes }

  has_many :images, class_name: "StudentSupportProgramImage"

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? && attributes['caption'].blank? }

  def to_param
    self.slug
  end
end
