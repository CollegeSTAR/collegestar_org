class CampusUnit < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :campus_id
  validates :campus_id, presence: true
  validates :director_first_name, presence: true
  validates :director_last_name, presence: true
  validates :director_email, presence: true

  belongs_to :campus
end
