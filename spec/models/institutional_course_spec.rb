require 'spec_helper'

RSpec.describe InstitutionalCourse do
  
  subject { build(:institutional_course) }

  describe "validations" do
    it { should validate_presence_of(:course_number) }
    it { should validate_presence_of(:course_name) }
    it { should validate_uniqueness_of(:course_number).case_insensitive }
  end

  describe "associations" do
    it { should belong_to(:campus) }
    it { should have_many(:faculty_course_associations) }
    it { should have_many(:faculty).through(:faculty_course_associations).source(:institutional_faculty) }
  end
end
