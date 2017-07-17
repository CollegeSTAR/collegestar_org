class StudentSupportProgram < ActiveRecord::Base
  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true
end
