require 'spec_helper'

RSpec.describe FacultyNominationSurveyPolicy do
  
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:surveys_admin) { create(:faculty_nomination_surveys_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :new?, :create? do
    it "grants admin access" do
      expect(subject).to permit(admin, FacultyNominationSurvey.new)
    end
    it "grants survey_admin access" do
      expect(subject).to permit(surveys_admin, FacultyNominationSurvey.new)
    end
    it "grants user access" do
      expect(subject).to permit(user, FacultyNominationSurvey.new)
    end
    it "grants null_user access" do
      expect(subject).to permit(null_user, FacultyNominationSurvey.new)
    end
  end

  permissions :index?, :show?, :edit?, :update?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, FacultyNominationSurvey.new)
    end
    it "grants surveys_admin access" do
      expect(subject).to permit(surveys_admin, FacultyNominationSurvey.new)
    end
    it "denies user access" do
      expect(subject).to_not permit(user, FacultyNominationSurvey.new) 
    end
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, FacultyNominationSurvey.new)
    end
  end
end
