class Role < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :access_controls
  has_many :users, through: :access_controls
  
  scope :grantable, -> { where(grantable: true) }
  scope :non_grantable, -> { where(grantable: false) }
end
