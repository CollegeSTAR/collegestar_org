class UniversalDesignForLearningResource < ActiveRecord::Base
  validates_uniqueness_of :title, :slug

  scope :published, -> { where(published: true ) }
  scope :unpublished, -> { where(published: false) }

  def to_param
    self.slug
  end
end
