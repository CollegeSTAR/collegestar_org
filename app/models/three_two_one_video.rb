class ThreeTwoOneVideo < ActiveRecord::Base
  validates :title, :slug, presence: true
  has_one_attached :screenshot

  scope :released, -> { where( released: true ) }
  scope :unreleased, -> { where( released: false ) }

  def to_param
    self.slug
  end
end
