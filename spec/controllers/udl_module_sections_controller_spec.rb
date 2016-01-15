require 'spec_helper'

RSpec.describe UdlModuleSectionsController do
  let(:udl_module) { create(:udl_module_with_sections) }
  describe "#index" do
    it "should render the index template" do
      get :index, udl_module_slug: udl_module.slug
      expect(response).to render_template(:index)
    end

    it "@udl_module_sections" do
      sections = UdlModuleSection.all
      get :index, udl_module_slug: udl_module.slug
      expect(assigns(:udl_module_sections)).to eq(sections)
    end
  end
end
