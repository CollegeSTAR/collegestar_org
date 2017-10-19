class MediaConsent < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  
  has_attached_file :image, styles: { thumb: "75", medium: "640" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :image
end
