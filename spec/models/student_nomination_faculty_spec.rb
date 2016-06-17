require 'rails_helper'

RSpec.describe StudentNominationFaculty do
  
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:campus_unit_id)}
    it { should validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { should belong_to(:department).class_name('CampusDepartment').with_foreign_key('campus_department_id') }
    it { should belong_to(:unit).class_name('CampusUnit').with_foreign_key('campus_unit_id') }
    it { should have_many(:student_nominations) }
  end
end
