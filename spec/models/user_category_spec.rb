require 'rails_helper'

RSpec.describe UserCategory do
  let(:user_category) { create(:user_category) }
  let(:non_selectable_user_category) { create(:non_selectable_user_category) }
  describe "validations" do
    subject { create(:user_category) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:user_category_associations).dependent(:destroy) }
    it { should have_many(:users).through(:user_category_associations) }
  end

  describe "scopes" do
    before(:each) do
      user_category
      non_selectable_user_category
    end
    subject { create(:user_category) }
    it "Selects only selectable categories with selectable scope" do
      expected_categories = [user_category]
      expect(UserCategory.selectable).to match_array(expected_categories)
    end
  end
end
