require 'spec_helper'

RSpec.describe FacultyNominationSurvey do
  subject(:faculty_nomination_survey) { create(:faculty_nomination_survey) }

  describe "validations" do
    it { should validate_presence_of(:teaching_strategy) }
    it { should validate_presence_of(:strategy_description) }
    it { should validate_presence_of(:teaching_strategy) }
  end

  describe "associations" do
    it { should belong_to(:institutional_faculty) }
    it { should belong_to(:department).class_name("InstitutionalDepartment") }
  end
end
