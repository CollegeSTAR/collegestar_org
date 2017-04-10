require 'rails_helper'

RSpec.describe CaseStudyProposal, type: :model do
  let(:proposal) { create(:case_study_proposal) }
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:university) }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:module_type) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:completion_date) }

    context "custom validations" do
      it "should validate module_type" do
        proposal.module_type = "not_a_module_type"
        proposal.valid?
        expect( proposal.errors[:module_type] ).to include("is not a valid module type")
      end
    end
  end
end
