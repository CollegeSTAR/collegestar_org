require 'spec_helper'

RSpec.describe RedesignSummary do
  let(:redesign_summary) { create(:redesign_summary) }
  describe "validations" do
    it { should validate_presence_of(:summary_content) }


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

  describe "associations" do
    it { should have_many(:attachments) }
  end

  describe "#initialize" do
    it "generates a uuid on initialization" do
      redesign_summary = RedesignSummary.new
      expect(redesign_summary.uuid).to_not be_nil
    end

    it "does not overwrite existing uuid" do
      redesign_summary
      expect(RedesignSummary.find(redesign_summary.id).uuid).to eq(redesign_summary.uuid)
    end
  end

  describe "#add_existing_attachments" do
    let(:uuid) { SecureRandom.uuid }
    let(:attachment_one) { create(:redesign_summary_attachment, redesign_summary_uuid: uuid) }
    let(:redesign_summary) { create(:redesign_summary, uuid: uuid) }
    context "with existing unpaired attachments" do
      it "should find existing attachments by uuid" do
        attachment_one
        redesign_summary
        redesign_summary.add_existing_attachments(attachment_klass: RedesignSummaryAttachment)
        redesign_summary.save
        redesign_summary.reload
        expect(redesign_summary.attachments).to include(attachment_one)
      end
    end
  end
end
