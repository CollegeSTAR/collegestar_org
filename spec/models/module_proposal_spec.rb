require 'rails_helper'

RSpec.describe ModuleProposal, type: :model do
  let(:module_proposal) { create(:module_proposal) }
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:university) }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:module_type) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:completion_date) }
    it { should validate_presence_of(:payment_method) }

    context "custom validations" do
      it "should validate module_type" do
        module_proposal.module_type = "not_a_module_type"
        module_proposal.valid?
        expect( module_proposal.errors[:module_type] ).to include("is not a valid module type")
      end

      it "should validate payment_method" do
        module_proposal.payment_method = "not_a_valid_payment_method"
        module_proposal.valid?
        expect( module_proposal.errors[:payment_method] ).to include("is not a valid payment method")
      end
    end
  end
end
