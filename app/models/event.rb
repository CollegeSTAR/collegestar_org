class Event < ActiveRecord::Base
  
  validates :name, :slug, presence: true

  def to_param
    self.slug
  end
end
