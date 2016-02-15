require 'spec_helper'

RSpec.describe UdlModuleSectionsController do      
  before(:each) do
    @user = create(:admin_user)
    cookies[:auth_token] = @user.auth_token
  end
  describe "#edit" do
  let(:udl_module) { create(:udl_module) }
  let(:section) { create(:introduction_section) }
    it "should render edit template" do
      udl_module.add_section(section)
      get :edit, udl_module_slug: udl_module.slug, slug: section.slug
      expect(response).to render_template(:edit)
    end
    it "should set udl_module" do
      udl_module.add_section(section)
      get :edit, udl_module_slug: udl_module.slug, slug: section.slug
      expect(assigns(:udl_module)).to eq(udl_module)
    end
    it "should set udl_module_section" do
      udl_module.add_section(section)
      get :edit, udl_module_slug: udl_module.slug, slug: section.slug
      expect(assigns(:udl_module_section)).to eq(section)
    end

    context "without authorized user" do
      it "should redirect user" do
        udl_module.add_section(section)
        cookies.delete :auth_token
       get :edit, udl_module_slug: udl_module.slug, slug: section.slug
       expect(response).to redirect_to(login_path)
      end
    end
  end
end
