require 'spec_helper'

RSpec.describe UniversalDesignForLearningResource do
  subject { create(:universal_design_for_learning_resource) }
  let(:published_resource) { create(:universal_design_for_learning_resource, published: true) }
  let(:unpublished_resource) { create(:universal_design_for_learning_resource) }

  describe "validations" do
    it { should validate_uniqueness_of(:title) }
    it { should validate_uniqueness_of(:slug) }
  end

  describe "published scope" do
    it "should return only published resources" do
      published_resource
      unpublished_resource
      expect(UniversalDesignForLearningResource.published).to match_array([published_resource])
    end
  end

  describe "unpublished scope" do
    it "should return only unpublished resources" do
      published_resource
      unpublished_resource
      expect(UniversalDesignForLearningResource.unpublished).to match_array([unpublished_resource])
    end
  end

  describe "#to_param" do
    it "should return slug from to_param" do
      expect(subject.to_param).to eq(subject.slug)
    end
  end
end
