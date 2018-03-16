class UserModuleHistory < ActiveRecord::Base
  
  validates_uniqueness_of :udl_module, scope: :user_id

  belongs_to :user
  belongs_to :udl_module
  has_many :assessments, class_name: 'UserModuleAssessment'
end
