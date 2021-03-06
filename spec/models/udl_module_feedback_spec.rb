require 'spec_helper'

RSpec.describe UdlModuleFeedback do

  describe "Validations" do
    it { should validate_presence_of(:udl_module) }
  end
  
  describe "Associations" do
    it { should belong_to(:udl_module) }
    it { should belong_to(:user) }
  end

  describe "delegation" do
    it { should delegate_method(:title).to(:udl_module).with_prefix }
  end
end
