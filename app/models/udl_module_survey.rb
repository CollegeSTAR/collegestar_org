class UdlModuleSurvey < ActiveRecord::Base

  validates :udl_module, presence: true

  belongs_to :udl_module
  belongs_to :udl_module_feedback
  belongs_to :user

  has_many :user_category_udl_module_survey_associations, dependent: :destroy
  has_many :user_categories, through: :user_category_udl_module_survey_associations
end
