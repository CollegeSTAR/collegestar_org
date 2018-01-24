require 'rails_helper'

RSpec.describe CaseStudyProposal, type: :model do
  let(:proposal) { create(:case_study_proposal) }
  let(:pending_proposal) { create(:case_study_proposal, accepted: false, denied: false) }
  let(:accepted_proposal) { create(:case_study_proposal, accepted: true, denied: false) }
  let(:denied_proposal) { create(:case_study_proposal, accepted: false, denied: true) }

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:university) }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:module_type) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:strategy_link)}
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

  describe "pending" do
    it "should return true for a pending proposal" do
      expect(pending_proposal.pending).to eq(true)
    end
    it "should return false for an accepted propsoal" do
      expect(accepted_proposal.pending).to eq(false)
    end
    it "should return false for a denied proposal" do
      expect(denied_proposal.pending).to eq(false)
    end
  end

  describe "accepted" do
    it "ensures that denied is false if accepted is set to true" do
      proposal.denied = true
      proposal.accepted = true
      expect(proposal.denied).to eq(false)
    end
  end

  describe "denied" do
    it "ensures taht accepted is false if denied is set to true" do
      proposal.accepted = true
      proposal.denied = true
      expect(proposal.accepted).to eq(false)
    end
  end

  describe "status" do
    it "should return accepted status when accepted == true" do
      proposal.accepted = true
      expect(proposal.status).to eq(CaseStudyProposal::ACCEPTED_STATUS)
    end

    it "should return denied status when denied == true" do
      proposal.denied = true
      expect(proposal.status).to eq(CaseStudyProposal::DENIED_STATUS)
    end

    it "should return pending status if neither accepted or denied are true" do
      expect(proposal.status).to eq(CaseStudyProposal::PENDING_STATUS)
    end
  end

  context "Proposal Scopes" do
    before(:each) do
      pending_proposal
      accepted_proposal
      denied_proposal
    end
    context "Pending Scope" do
      it "should only return case studies that are pending" do
        expect(CaseStudyProposal.pending).to eq([pending_proposal])
      end
    end

    context "Accepted Scope" do
      it "should only return accepted case studies" do
        expect(CaseStudyProposal.accepted).to eq([accepted_proposal])
      end
    end

    context "Denied Scope" do
      it "should only return denied case studies" do
        expect(CaseStudyProposal.denied).to eq([denied_proposal])
      end
    end
  end
end
