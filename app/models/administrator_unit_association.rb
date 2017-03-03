class AdministratorUnitAssociation < ActiveRecord::Base
  belongs_to :institutional_administrator
  belongs_to :institutional_unit
end
