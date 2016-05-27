require 'spec_helper'

RSpec.describe Faculty::RedesignSummariesController do
  
  let(:redesign_summary) { create(:redesign_summary) }
  before(:each) do
    user = create(:admin_user)
    cookies[:auth_token] = user.auth_token
  end
end
