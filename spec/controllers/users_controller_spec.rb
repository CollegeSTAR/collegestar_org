require 'rails_helper'

RSpec.describe UsersController do
  describe "GET index" do
    context "while not authenticated" do
      it "should redirect to login_path" do
        get :index
        expect(response).to redirect_to login_path
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
      end
      it "should successfully render" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "should render index template" do
        get :index
        expect(response).to render_template(:index)
      end
      it "should popluate an array of users" do
        get :index
        expect(assigns(:users)).to match_array([@user])
      end
    end
  end

  describe "GET show" do
    before(:each) do
      @user = create(:admin_user)
      cookies.delete(:auth_token)
    end
    context "while not authenticated" do
      it "should redirect to login_path" do
        get :show, id: @user
        expect(response).to redirect_to login_path
      end
    end
    context "while authenticated" do
      before(:each) do
        cookies[:auth_token] = @user.auth_token
      end
      it "should successfully render profile" do
        get :show, id: @user
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "should render show template" do
        get :show, id: @user
        expect(response).to render_template(:show)
      end
      it "should initialize user" do
        get :show, id: @user
        expect(assigns(:user)).to eq(@user)
      end
    end
  end

  describe "GET edit" do
    before(:each) do
      @user = create(:admin_user)
    end
    context "while not authenticated" do
      it "should redirect to login_path" do
        cookies.delete(:auth_token)
        get :edit, id: @user
        expect(response).to redirect_to login_path
      end
    end
    context "while authenticated" do
      before(:each) do
        cookies[:auth_token] = @user.auth_token
      end
      it "should instantiate a user variable" do
      get :edit , id: @user
      expect(assigns(:user)).to eq(@user)
      end
    end
  end

  describe "GET new" do
    it "should successfully render" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "should render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    it "should create a new user record" do
      expect {
        post :create, user: attributes_for(:user)
      }.to change { User.count } .by(1)
    end

    it "should redirect to user profile on create" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to profile_path(User.last)
    end
  end

  describe "Patch update" do
    before(:each) do
      @user = create(:admin_user)
      cookies[:auth_token] = @user.auth_token
    end
    it "should redirect to user profile" do
      patch :update, id: @user, user: attributes_for(:user)
      expect(response).to redirect_to profile_path(@user)
    end
    it "should update the record" do
      patch :update, id: @user, user: attributes_for(:user, first_name: "new_first_name")
      expect(assigns(:user).first_name).to eq("new_first_name")
    end
  end

  describe "delete destroy" do
    before(:each) do
      @user = create(:admin_user)
      cookies[:auth_token] = @user.auth_token
    end
    it "should delete the record" do
      expect {
        delete :destroy, id: @user
      }.to change { User.count } .by(-1)
    end
    it "should redirect to users index" do
      delete :destroy, id: @user
      expect(response).to redirect_to users_path
    end
  end
end
