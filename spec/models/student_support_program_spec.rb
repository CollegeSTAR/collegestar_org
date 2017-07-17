require 'spec_helper'

RSpec.describe StudentSupportProgram do
  let(:program) { create(:student_support_program) }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:slug) }
  end

  describe "to_param" do
    it "should return slug" do
      expect(program.to_param).to eq(program.slug)  
    end
  end
end
