class SendgridEventPost < ActiveRecord::Base
  
  validates :data, presence: true
end
