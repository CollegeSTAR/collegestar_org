require 'rails_helper'

RSpec.describe CampusUnitAssociation do
  
  describe "associations" do
    it { should belong_to(:campus) }
    it { should belong_to(:campus_unit) }
  end
end
