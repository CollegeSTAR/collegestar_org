class ThreeTwoOneVideoProposal < ActiveRecord::Base
  validates :first_name, :last_name, :email, :title, presence: true
  has_secure_token
end
