class InstitutionalDepartment < InstitutionalUnit
  
  belongs_to :institutional_unit
  has_many :administrator_unit_associations, foreign_key: :institutional_unit_id
  has_many :chairs, through: :administrator_unit_associations, source: :institutional_administrator
  has_many :department_faculty_associations, foreign_key: :department_id
  has_many :faculty, through: :department_faculty_associations
end
