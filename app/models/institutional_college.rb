class InstitutionalCollege < InstitutionalUnit
  
  has_many :administrator_unit_associations, foreign_key: :institutional_unit_id
  has_many :deans, through: :administrator_unit_associations, source: :institutional_administrator
  has_many :departments, class_name: "InstitutionalDepartment", foreign_key: :institutional_unit_id
end
