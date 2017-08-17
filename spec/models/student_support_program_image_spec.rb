require 'spec_helper'

RSpec.describe StudentSupportProgramImage do
  
  describe "validations" do
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
  end

  describe "associations" do
    it { should belong_to(:student_support_program) }
  end
end
