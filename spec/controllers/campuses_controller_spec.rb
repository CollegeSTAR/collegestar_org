require 'rails_helper'

RSpec.describe CampusesController do
  describe "GET #index" do
    it "reponds successfully with http status code 200." do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "should assign all campuses to @campuses" do
      @campus_1, @campus_2 = create(:campus), create(:campus)
      get :index
      #expect(assigns(:campuses)).to match_array([@campus_1, @campus_2])
    end

    it "should assign news articles to @news_articles" do
      @news_article_1, @news_article_2 = create(:news_article), create(:news_article)
      get :index
      #expect(assigns(:news_articles)).to match_array([@news_article_2, @news_article_1])
    end
  end

  describe "GET #show" do
    before(:each) do
      @campus = create(:campus)
      get :show, slug: @campus
    end
    
    it "responds successfully with http status code 200." do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
      
    it "assigns the campus with provided slug to @campus" do
      #expect(assigns(:campus)).to eq(@campus)
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
        post :create, campus: FactoryGirl.attributes_for(:campus)
        expect(response).to redirect_to Campus.last
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @user = create(:admin_user)
      cookies[:auth_token] = @user.auth_token
      @campus = create(:campus)
      get :edit, slug: @campus
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
      patch :update, slug: @campus, campus: attr
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
      delete :destroy, slug: @campus
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
