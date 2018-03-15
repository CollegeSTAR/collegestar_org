class UserModuleHistory < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :udl_module
end
