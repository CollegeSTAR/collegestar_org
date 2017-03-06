class InstitutionalFaculty < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email

  belongs_to :campus
end
