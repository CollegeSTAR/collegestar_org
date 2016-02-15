require 'spec_helper'

RSpec.describe UdlModuleSectionsController do      
  before(:each) do
    @user = create(:admin_user)
    cookies[:auth_token] = @user.auth_token
  end
  let(:udl_module) { create(:udl_module_with_sections) }
end
