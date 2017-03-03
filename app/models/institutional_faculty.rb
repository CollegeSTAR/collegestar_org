class InstitutionalFaculty < ActiveRecord::Base
  validates_uniqueness_of :email

  belongs_to :campus

end
