require 'spec_helper'

RSpec.describe RedesignSummary do
  let(:redesign_summary) { create(:redesign_summary) }
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:campus) }
    it { should validate_presence_of(:implemented_technique) }
    it { should validate_presence_of(:redesign_process) }
    it { should validate_presence_of(:redesign_process) }
    it { should validate_presence_of(:assessment_description) }
    it { should validate_presence_of(:examples) }
    it { should validate_presence_of(:challenges) }

    it "validates atleast one udl principle is true" do
      # A redesign summary without any principles set to true
      # should not be valid!
      redesign_summary = build(
                                :redesign_summary, 
                                representation: false, 
                                action_expression: false,
                                engagement: false
                              )
      redesign_summary.valid?
      expect(redesign_summary.errors[:udl_principles]).to include("Atleast one(1) udl principle must be checked")
    end
  end
end
