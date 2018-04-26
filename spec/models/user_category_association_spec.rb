require 'rails_helper'

RSpec.describe UserCategoryAssociation do
  
  describe "associations" do
    it { should belong_to(:user_category) }
    it { should belong_to(:user) }
  end
end
