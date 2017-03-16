class InstitutionalCollege < InstitutionalUnit
  
  has_many :departments, class_name: "InstitutionalDepartment", foreign_key: :institutional_unit_id, dependent: :nullify
  has_many :administrator_unit_associations, foreign_key: :institutional_unit_id, dependent: :destroy
  has_many :deans, -> { distinct }, through: :administrator_unit_associations, source: :institutional_administrator
  has_one :current_dean_unit_association, -> { where current_dean: true }, 
                                             class_name: "AdministratorUnitAssociation",
                                             foreign_key: :institutional_unit_id, 
                                             dependent: :destroy
  has_one :current_dean, through: :current_dean_unit_association, source: :institutional_administrator
end
