class SendgridEvent < ActiveRecord::Base
  validates :sg_event_id, allow_nil: true, uniqueness: true  
  validates :event, :email, presence: true
end
