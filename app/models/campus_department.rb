class CampusDepartment < ActiveRecord::Base
  
  validates :name, :chair_first_name, :chair_last_name, :chair_email, presence: true
  validates_uniqueness_of :name, scope: :campus_id
  validates :campus_id, presence: true

  belongs_to :campus
end
