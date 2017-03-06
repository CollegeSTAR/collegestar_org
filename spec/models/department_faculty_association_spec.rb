require 'spec_helper'

RSpec.describe DepartmentFacultyAssociation do
  
  describe "associaitons" do
    it { should belong_to(:department).class_name("InstitutionalDepartment") }
    it { should belong_to(:faculty).class_name("InstitutionalFaculty") }
  end
end
