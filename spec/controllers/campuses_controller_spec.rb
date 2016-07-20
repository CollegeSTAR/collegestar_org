require 'rails_helper'

RSpec.describe CampusesController do
  describe "GET #index" do
    it "reponds successfully with http status code 200." do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end


  describe "GET #show" do
    before(:each) do
      @campus = create(:campus)
      get :show, params: { slug: @campus }
    end
    
    it "responds successfully with http status code 200." do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    before(:each) do
      @user = create(:admin_user)
      cookies[:auth_token] = @user.auth_token
    end
    it "responds successfully with HTTP status code 200" do
      get :new
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    before(:each) do
      @user = create(:admin_user)
      cookies[:auth_token] = @user.auth_token
    end

    context "with valid attributes" do
      it "redirects to campus show page for new event." do
        post :create, params: { campus: FactoryGirl.attributes_for(:campus) }
        expect(response).to redirect_to Campus.last
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @user = create(:admin_user)
      cookies[:auth_token] = @user.auth_token
      @campus = create(:campus)
      get :edit, params: { slug: @campus }
    end
    it "responds successfully with an HTTP 200 status code" do 
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH #update" do
    let(:attr) do
      FactoryGirl.attributes_for(:campus, name: "Test Campus")
    end

    before(:each) do
      @user = create(:admin_user)
      cookies[:auth_token] = @user.auth_token
      @campus = create(:campus)
      patch :update, params: { slug: @campus, campus: attr }
      @campus.reload
    end

    it "redirects to #show @campus upon update" do
      expect(response).to redirect_to @campus
    end
  end

  describe "DELETE #destroy" do
    before(:each) do 
      @user = create(:admin_user)
      cookies[:auth_token] = @user.auth_token
      @campus = create(:campus)
      delete :destroy, params: { slug: @campus }
    end
    
    it "responds successfully with status code 302" do
      expect(response).to have_http_status(302)
    end

    it "redirects to #index action" do
      expect(response).to redirect_to campuses_path
    end

    it "shows flash notice about deleted record." do
      expect(flash[:notice]).to eq("The campus was removed.")
    end

    it "removes campus from database" do
      expect(Campus.count).to eq(0)
    end
  end
end
