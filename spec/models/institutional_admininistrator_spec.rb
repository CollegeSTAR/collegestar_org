require 'spec_helper'

RSpec.describe InstitutionalAdministrator do
  subject { build(:institutional_administrator) }
  
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:admin_email) }
    it { should validate_uniqueness_of(:admin_email) }
  end

  describe "associations" do
    it { should have_many(:administrator_unit_associations) }
  end
end
