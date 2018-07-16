class ThreeTwoOneVideo < ActiveRecord::Base
  validates :title, :slug, presence: true
  has_one_attached :screenshot

  scope :released, -> { where( released: true ).order(:created_at) }
  scope :unreleased, -> { where( released: false ).order(:created_at) }

  def to_param
    self.slug
  end
end
