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
