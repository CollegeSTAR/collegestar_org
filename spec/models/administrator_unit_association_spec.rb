require 'spec_helper'

RSpec.describe AdministratorUnitAssociation do
  
  describe "Associations" do
    it { should belong_to(:institutional_administrator) }
    it { should belong_to(:institutional_unit) }
    it { should belong_to(:institutional_college) }
    it { should belong_to(:institutional_department) }
  end
end
