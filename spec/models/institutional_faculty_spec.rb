require 'spec_helper'

RSpec.describe InstitutionalFaculty do
 
  subject { build(:institutional_faculty) }

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
  describe "associations" do
    it { should belong_to(:campus) }
    it { should have_many(:faculty_course_associations).dependent(:destroy) }
    it { should have_many(:courses).through(:faculty_course_associations).source(:institutional_course) }
    it { should have_many(:faculty_nomination_surveys) }
  end
end
