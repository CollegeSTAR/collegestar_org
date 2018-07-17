class UserCategoryUdlModuleSurveyAssociation < ActiveRecord::Base
  
  validates :user_category, :udl_module_survey, presence: true

  belongs_to :user_category
  belongs_to :udl_module_survey
end
