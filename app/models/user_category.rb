class UserCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :user_category_associations, dependent: :destroy
  has_many :users, through: :user_category_associations

  scope :selectable, -> { where(selectable: true)}
end
