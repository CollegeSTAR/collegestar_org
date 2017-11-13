require 'spec_helper'

RSpec.describe AccessControl do
  
  describe "Associations" do
    it { should belong_to(:role) }
    it { should belong_to(:user) }
  end
end
