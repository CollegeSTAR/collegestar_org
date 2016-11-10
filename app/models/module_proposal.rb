class ModuleProposal < ActiveRecord::Base

  validates :first_name, :last_name, :university, :department, :email, 
            :title, :description, :start_date, :completion_date,
            presence: true
  validates :module_type, presence: true, 
            udl_module_type: { 
              valid_module_types: 
              [
                'new_module', 
                'case_study'
              ] 
            }

  liquid_methods :first_name
end
