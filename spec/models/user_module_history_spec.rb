require 'spec_helper'

RSpec.describe UserModuleHistory do

  describe "validations" do
    subject { create(:user_module_history) }
    it { should validate_uniqueness_of(:udl_module).scoped_to(:user_id) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:udl_module) }

    it { should have_many(:assessments).class_name('UserModuleAssessment') }
  end
end
