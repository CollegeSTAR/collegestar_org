require 'rails_helper'

RSpec.describe SessionsController do
  describe "#new" do
    before(:each) do
      get :new
    end
    it "responds successfully with http status code 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    before(:each) do
      @user = create(:user)
      @user_attributes = attributes_for(:user)
    end
    context "with correct params" do
      before(:each) do
        post :create, params: { email: @user.email, password: @user_attributes[:password] }
      end
      it "should set user_id session if user is found." do
        expect(cookies[:auth_token]).to eq(@user.auth_token)
      end
      it "should redirect to root_url if login is successful" do
        expect(response).to redirect_to(:root)
      end
    end
    context "with incorrect email" do
      before(:each) do
        post :create, params: { email: "not_correct@example.com", password: @user_attributes[:password] }
      end
      it "should not set the auth_token cookie" do
        expect(cookies[:auth_token]).to be_nil  
      end
    end
    context "with incorrect password" do
      before(:each) do
        post :create, params: { email: @user_attributes[:email], password: "not_correct_password" }
      end
      it "should not set the user_id session variable" do
        expect(cookies[:auth_token]).to be_nil
      end
    end
  end

  describe "#destroy" do
    context "a user is logged in" do
      before(:each) do
        @user = create(:user)
        @user_attributes = attributes_for(:user)
        post :create, params: { email: @user.email, password: @user_attributes[:password] }
        get :destroy
      end
      it "should unset the session[:user_id] variable" do
        expect(cookies[:auth_token]).to be_nil
      end
      it "should redirect to root_url" do
        expect(response).to redirect_to(:root)
      end
    end
  end
end
