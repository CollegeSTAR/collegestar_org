class AdministratorUnitAssociation < ActiveRecord::Base
  belongs_to :institutional_administrator
  belongs_to :institutional_unit
  belongs_to :institutional_college, foreign_key: 'institutional_unit_id'
  belongs_to :institutional_department, foreign_key: 'institutional_unit_id'

end
