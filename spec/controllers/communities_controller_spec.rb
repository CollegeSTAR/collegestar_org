require 'rails_helper'

RSpec.describe CommunitiesController do
  describe "#index" do
    before(:each) do
      get :index
    end
    it "responds successfully with a http status code of 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    before(:each) do
      @community = create(:community)
      get :show, params: { slug: @community }
    end
    it "responds successfully with a http status code of 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#edit" do
    before(:each) do
      @community = create(:community)
      get :edit, params: { slug: @community }
    end
    it "responds successfully with a http status code of 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
  
  describe "#new" do
    before(:each) do
      get :new
    end
    it "responds successfully with a http status code of 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    context "valid parameters" do
      it "should create a new community record" do
        expect{
          post :create, params: { community: attributes_for(:community) }
        }.to change(Community, :count).by(1)
      end
      it "should redirect to #show for newly created community" do
          post :create, params: { community: attributes_for(:community) }
          expect(response).to redirect_to(Community.last)
      end
    end
    context "invalid parameters" do
      it "should not create a new community record" do
        expect{
          post :create, params: { community: attributes_for(:community, name: nil) }
        }.to_not change(Community, :count)
      end
    end
  end
end
