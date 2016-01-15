require 'rails_helper'

RSpec.describe ApplicationController do
  
  controller do
    def index
      @user = current_user
      render text: "index called"
    end

    def create
      create_session(
        email: params[:email],
        password: params[:password],
        permanent: params[:permanent]
      )
      render text: "create called"
    end

    def destroy
      destroy_session
      render text: "destroy called"
    end
  end

  describe "#current_user" do
    it "Should return nil when no user is authenticated" do
      get :index
      expect(assigns(:user)).to be_nil
    end
    it "should return a user when user is authenticated" do
      @user = create(:user)
      cookies[:auth_token] = @user.auth_token
      get :index
      expect(assigns(:user).auth_token).to eq(@user.auth_token)
    end
  end

  describe "#create_session" do
    before(:each) do
      @user = create(:user)
    end
    it "should create a session with correct user parameters" do
      post :create, email: @user.email, password: @user.password
      expect(cookies[:auth_token]).to eq(@user.auth_token)
    end

    it "should not create a session with incorrect user password" do
      post :create, email: @user.email, password: "not_correct"
      expect(cookies[:auth_token]).to be_nil
    end
    it "should not create a session with incorrect email" do
      post :create, email: "wrong.example.com", password: "not_correct"
      expect(cookies[:auth_token]).to be_nil
    end
  end

  describe "#destroy_session" do
    it "should delete the auth_token cookie" do
      @user = create(:user)
      cookies[:auth_token] = @user.auth_token
      post :destroy, id: 1
      expect(cookies[:auth_token]).to be_nil
    end
  end
end
