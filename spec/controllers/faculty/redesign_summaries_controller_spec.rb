require 'spec_helper'

RSpec.describe Faculty::RedesignSummariesController do
  
  let(:redesign_summary) { create(:redesign_summary) }
  
  describe "#new" do
    it "returns a 200 OK status" do
      get :new
      expect(response).to have_http_status(:ok)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns @redesign_summary" do
      get :new
      expect(assigns(:redesign_summary)).to be_kind_of(RedesignSummary)
    end
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

  describe "#create" do
        let(:user) { create(:admin_user) }
      before(:each) do
        cookies[:auth_token] = user.auth_token
      end    
    context "with valid params" do

      it "renders the confirmation template" do
        post :create, redesign_summary: attributes_for(:redesign_summary)
        expect(response).to render_template(:confirmation)
      end
      it "creates a new summary" do
        expect {
          post :create, redesign_summary: attributes_for(:redesign_summary)
        }.to change{ RedesignSummary.count }.by(1)
      end

      it "sets the summary.user to current_user" do
        post :create, redesign_summary: attributes_for(:redesign_summary)
        expect(assigns(:redesign_summary).user).to eq(user)
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, redesign_summary: attributes_for(:redesign_summary, representation: false, action_expression: false, engagement: false)
        expect(response).to render_template(:new)
      end
    end
  end
end
