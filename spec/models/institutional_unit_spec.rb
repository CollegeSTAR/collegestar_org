require 'spec_helper'

RSpec.describe InstitutionalUnit do
  
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Associations" do
    it { should belong_to(:campus) }
  end
end
