class DssContact < ActiveRecord::Base
  
  INSTITUTION_TYPES = [
    'community_college',
    'unc',
    'private_college'
  ]

  validates :institution_type, :slug, :campus_name, :dss_office, presence: true
  validates :slug, :campus_name, uniqueness: true

  scope :community_college, -> { where( institution_type: 'community_college' ) }
  scope :unc, -> { where( institution_type: 'unc') }
  scope :private_college, -> { where( institution_type: 'private_college') }

  def to_param
    slug
  end
end
