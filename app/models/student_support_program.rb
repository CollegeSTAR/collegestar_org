class StudentSupportProgram < ActiveRecord::Base
  validates :name, :slug, presence: true
end
