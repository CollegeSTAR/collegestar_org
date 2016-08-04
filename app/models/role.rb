class Role < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  has_many :access_controls
  has_many :users, through: :access_controls
  
end
