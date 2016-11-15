require 'spec_helper'

RSpec.describe FrequentlyAskedQuestion do
  
  describe "Validations" do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:answer) }
    it { should validate_presence_of(:slug) }
  end
end
