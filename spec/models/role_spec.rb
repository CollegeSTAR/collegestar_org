require 'rails_helper'

RSpec.describe Role do 
  let(:grantable_role) { create(:grantable_role) }
  let(:non_grantable_role) { create(:non_grantable_role) }
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:description) }
  end
  
  describe "grantable scope" do
    it "correctly scopes grantable_role" do
      grantable_role
      non_grantable_role
      expect(Role.grantable).to include(grantable_role)
    end
    it "correctly scopes non_grantable_role" do
      grantable_role
      non_grantable_role
      expect(Role.grantable).to_not include(non_grantable_role)
    end
  end

  describe "non_grantable scope" do
    it "correctly scopes non_grantable_role" do
      non_grantable_role
      grantable_role
      expect(Role.non_grantable).to include(non_grantable_role)
    end
    it "correctly scopes grantable_role" do
      non_grantable_role
      grantable_role
      expect(Role.non_grantable).to_not include(grantable_role)
    end
  end
end
