class UserCategoryAssociation < ActiveRecord::Base
  
  belongs_to :user_category
  belongs_to :user
end
