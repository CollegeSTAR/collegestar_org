require 'spec_helper'

RSpec.describe StarLearningCommunityRegistration do
  
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:university) }
    it { should validate_presence_of(:slc) }
  end
end
