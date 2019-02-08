require 'spec_helper'

RSpec.describe FacultyNominationSurvey do
  subject(:faculty_nomination_survey) { create(:faculty_nomination_survey) }
  subject(:nomination_not_appropriate) { create(:faculty_nomination_survey, not_appropriate: true) }

  describe "validations" do
    it { should validate_presence_of(:teaching_strategy) }
    it { should validate_presence_of(:strategy_description) }
    it { should validate_presence_of(:teaching_strategy) }
  end

  describe "associations" do
    it { should belong_to(:institutional_faculty) }
    it { should belong_to(:department).class_name("InstitutionalDepartment") }
  end

  describe "scopes" do
    before(:each) do
      faculty_nomination_survey
      nomination_not_appropriate
    end
    it "should only return appropriate nominations" do
      expect(FacultyNominationSurvey.appropriate).to match([faculty_nomination_survey])
    end
  end
end
