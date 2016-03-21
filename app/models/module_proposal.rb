class ModuleProposal < ActiveRecord::Base

  validates :first_name, :last_name, :university, :department, :email, 
            :title, :description, :completion_date,
            presence: true
  validates :module_type, presence: true, 
            udl_module_type: { 
              valid_module_types: 
              [
                'new_module', 
                'case_study'
              ] 
            }
  validates :payment_method, presence: true, 
            udl_module_payment_method: { 
              valid_payment_methods: 
              [
                'pay_supplement', 
                'travel_support',
                'technology_purchase',
                'organization_dues'
              ] 
            }
end
