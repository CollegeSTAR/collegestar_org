class InstitutionalAdministrator < ActiveRecord::Base
  
  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  has_many :administrator_unit_associations 
  has_many :units, through: :administrator_unit_associations, foreign_key: "insitutional_unit_id"

end
