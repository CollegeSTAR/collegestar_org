require 'spec_helper'

RSpec.describe Faculty::RedesignSummariesController do
  
  let(:redesign_summary) { create(:redesign_summary) }
  before(:each) do
    user = create(:admin_user)
    cookies[:auth_token] = user.auth_token
  end
 
  describe "#show" do
    it "renders the show template" do
      get :show, id: redesign_summary.id
      expect(response).to render_template(:show)
    end
    it "assigns @redesign_summary correctly" do
      get :show, id: redesign_summary.id
      expect(assigns(:redesign_summary)).to eq(redesign_summary)
    end
  end

  describe "#edit" do
    it "renders the edit template" do
      get :edit, id: redesign_summary.id
      expect(response).to render_template(:edit)
    end
    it "assigns @redesign_summary correctly" do
      get :edit, id: redesign_summary.id
      expect(assigns(:redesign_summary)).to eq(redesign_summary)
    end
  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
    it "assigns @redesign_summaries correctly" do
      get :index
      expect(assigns(:redesign_summaries)).to eq(RedesignSummary.all)
    end
  end
end
