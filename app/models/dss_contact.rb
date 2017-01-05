class DssContact < ActiveRecord::Base
  
  INSTITUTION_TYPES = [
    ['Community College', 'community_college'],
    ['UNC System University', 'unc'],
    ['Private College', 'private_college']
  ]

  validates :institution_type, :slug, :campus_name, :dss_office, presence: true
  validates :slug, :campus_name, uniqueness: true

  scope :community_college, -> { where( institution_type: 'community_college' ).order( campus_name: :asc ) }
  scope :unc, -> { where( institution_type: 'unc').order( campus_name: :asc) }
  scope :private_college, -> { where( institution_type: 'private_college').order( campus_name: :asc ) }

  def to_param
    slug
  end
end
