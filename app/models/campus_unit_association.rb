class CampusUnitAssociation < ActiveRecord::Base
  belongs_to :campus
  belongs_to :campus_unit
end
