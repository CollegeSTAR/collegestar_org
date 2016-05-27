require 'spec_helper'

RSpec.describe UdlModuleSectionsController do      
  let(:udl_module) { create(:udl_module) }
  let(:section) { create(:introduction_section) }
  let(:section_attr) { attributes_for(:introduction_section) }
  before(:each) do
    @user = create(:admin_user)
    cookies[:auth_token] = @user.auth_token
  end
  describe "#create" do
    it "should create a new section" do
      expect{
        post :create, udl_module_slug: udl_module.slug, udl_module_section: attributes_for(:introduction_section)
      }.to change { UdlModuleSection.count }.by(1)
    end
  end
  
  describe "#edit" do
    context "without authorized user" do
      it "should redirect user" do
        udl_module.add_section(section)
        cookies.delete :auth_token
       get :edit, udl_module_slug: udl_module.slug, slug: section.slug
       expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "#update" do
    before(:each) do
      udl_module.add_section(section)
    end
    it "should update the module_section" do
    new_content = 'new content blah blah blah'
    patch :update, udl_module_slug: udl_module.slug, slug: section.slug, udl_module_section: attributes_for(:introduction_section, content: new_content)
    section.reload
    expect(section.content).to eq(new_content)
    end
  end
end
