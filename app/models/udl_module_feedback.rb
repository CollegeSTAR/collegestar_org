class UdlModuleFeedback < ActiveRecord::Base
  
  validates :udl_module, presence: true
  belongs_to :udl_module
  belongs_to :user

  delegate :title, to: :udl_module, prefix: true
end
