require 'rails_helper'

RSpec.describe SendgridEventPost do
  
  describe "validations" do
    it { should validate_presence_of(:data) }
  end
end
