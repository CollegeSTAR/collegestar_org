require 'spec_helper'

RSpec.describe InstitutionalDepartment do
  
  describe "associations" do
    it { should belong_to(:institutional_unit) }      
    it { should have_many(:administrator_unit_associations).with_foreign_key("institutional_unit_id").dependent(:destroy) }
    it { should have_many(:chairs).through(:administrator_unit_associations).source(:institutional_administrator) }
    it { should have_many(:department_faculty_associations).with_foreign_key("department_id").dependent(:destroy) }
    it { should have_many(:faculty).through(:department_faculty_associations) }
  end
end
