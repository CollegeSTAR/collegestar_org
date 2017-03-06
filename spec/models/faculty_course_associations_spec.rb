require 'spec_helper'

RSpec.describe FacultyCourseAssociation do
  
  describe "associations" do
    it { should belong_to :institutional_faculty }
    it { should belong_to :institutional_course }
  end
end
