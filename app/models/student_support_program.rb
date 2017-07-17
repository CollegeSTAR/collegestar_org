class StudentSupportProgram < ActiveRecord::Base
  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true

  def to_param
    self.slug
  end
end
