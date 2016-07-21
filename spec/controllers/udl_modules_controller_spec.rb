require 'spec_helper'

RSpec.describe UdlModulesController do    
  let(:module_one) { create(:udl_module) }
  let(:module_two) { create(:udl_module) }
  
  describe "index" do
    it "should respond successfully" do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe "show" do
    before(:each) do
      module_one
    end
    it "should respond successfully" do
      get :show, params: { slug: module_one.slug }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe "new" do
    before(:each) do
      user = create(:admin_user)
      cookies[:auth_token] = user.auth_token
    end
    context "not authenticated" do
      it "should redirect to login" do
        cookies.delete :auth_token
        get :new
        expect(response).to redirect_to(login_path)
      end
    end
    it "should respond successfully" do
      get :new
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe "create" do
    let(:mod_attributes) {  attributes_for(:new_udl_module) }
    let(:shared_section) { create(:shared_introduction_section) }
    let(:user) { create(:admin_user) }
    before(:each) do
      cookies[:auth_token] = user.auth_token
    end

    it "should add user as author of module" do
      post :create, params: { udl_module: mod_attributes }
      udl_module = UdlModule.find_by slug: mod_attributes[:slug]
      expect(udl_module.authors).to match_array([user])
    end

    it "author_is_contributing_faculty is selected" do
      post :create, params: { udl_module: mod_attributes, author_is_contributing_faculty: "1" }
      udl_module = UdlModule.find_by slug: mod_attributes[:slug]
      expect(udl_module.faculty).to match_array([user])
    end

    it "author_is_contributing_faculty is not selected" do
      post :create, params: { udl_module: mod_attributes }
      udl_module = UdlModule.find_by slug: mod_attributes[:slug]
      expect(udl_module.faculty).to_not include([user])
    end
    it "adds shared_sections" do
      shared_section
      post :create, params: { udl_module: mod_attributes }
      udl_module = UdlModule.find_by slug: mod_attributes[:slug]
      expect(udl_module.sections).to match_array([shared_section])
    end
  end
end
