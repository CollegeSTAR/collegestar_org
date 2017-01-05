require 'spec_helper'

RSpec.describe DssContact do
  subject { build(:dss_contact) }
  let(:community_college_dss_contact) { create(:community_college_dss_contact) }

  describe 'validations' do
    it { should validate_presence_of(:institution_type) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:campus_name) }
    it { should validate_presence_of(:dss_office) }
    it { should validate_uniqueness_of(:slug) }
    it { should validate_uniqueness_of(:campus_name) }
  end

  describe 'to_param' do
    it 'returns the slug' do
      expect(community_college_dss_contact.to_param).to eq(community_college_dss_contact.slug) 
    end
  end
end
