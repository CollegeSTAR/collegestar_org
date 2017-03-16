require 'spec_helper'

RSpec.describe InstitutionalCollege do

  describe "Associations" do
    it { should have_many(:administrator_unit_associations).with_foreign_key('institutional_unit_id').dependent(:destroy) }
    it { should have_many(:deans).through(:administrator_unit_associations).source('institutional_administrator') }
    it { should have_many(:departments).class_name('InstitutionalDepartment').dependent(:nullify) }
  end
end
