require 'rails_helper'

RSpec.describe CampusDepartment do
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:campus_id) }
    it { should validate_presence_of(:campus_id)}
    it { should validate_presence_of(:chair_first_name) }
    it { should validate_presence_of(:chair_last_name) }
    it { should validate_presence_of(:chair_email) }
  end

  describe "associations" do
    it { should belong_to(:campus) }
  end
end
