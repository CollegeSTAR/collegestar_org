require 'spec_helper'

RSpec.describe UniversalDesignForLearningResourcePolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:udl_resources_admin) { create(:udl_resources_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index?, :show? do
    it "allows access to admin user" do
      expect(subject).to permit(admin, UniversalDesignForLearningResource.new)
    end
    it "allows access to udl_resources admin" do
      expect(subject).to permit(udl_resources_admin, UniversalDesignForLearningResource.new)
    end
    it "allows access to user" do
      expect(subject).to permit(user, UniversalDesignForLearningResource.new)
    end

    it "allows access to null_user" do
      expect(subject).to permit(null_user, UniversalDesignForLearningResource.new)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :view_admin? do
    it "allows access to admin user" do
      expect(subject).to permit(admin, UniversalDesignForLearningResource.new)
    end
    it "allows access to udl_resources_admin" do
      expect(subject).to permit(udl_resources_admin, UniversalDesignForLearningResource.new)
    end
    it "allows access to user" do
      expect(subject).not_to permit(user, UniversalDesignForLearningResource.new)
    end

    it "allows access to null_user" do
      expect(subject).not_to permit(null_user, UniversalDesignForLearningResource.new)
    end

  end
end
