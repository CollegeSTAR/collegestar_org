class StarLearningCommunityRegistration < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name, :email, :department, :university, :slc
end
