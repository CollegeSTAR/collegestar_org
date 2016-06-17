class CampusUnit < ActiveRecord::Base
  validates :name, :campus_id, :director_first_name, :director_last_name, 
            :director_email, presence: true
  validates_uniqueness_of :name, scope: :campus_id

  belongs_to :campus
end
