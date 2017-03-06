class InstitutionalAdministrator < ActiveRecord::Base
  
  validates :first_name, :last_name, :admin_email, presence: true
  validates_uniqueness_of :admin_email

  has_many :administrator_unit_associations 
  has_many :units, through: :administrator_unit_associations, foreign_key: "insitutional_unit_id"

end
