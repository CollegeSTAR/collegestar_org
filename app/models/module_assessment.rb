class ModuleAssessment < ActiveRecord::Base
  validates :status, presence: true

  belongs_to :udl_module
end
