class InstitutionalUnit < ActiveRecord::Base
  
  validates :name, presence: true
  belongs_to :campus
end
