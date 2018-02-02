require 'spec_helper'

RSpec.describe UserModuleHistory do
  
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:udl_module) }
  end
end
