require 'rails_helper'

RSpec.describe ContactsController do
  describe "#index" do
    let(:user) { create(:user) }
    let(:contact_admin_role) { create(:contact_admin_role) }
    before(:each) do
      cookies[:auth_token] = user.auth_token
      user.roles << contact_admin_role
      get :index
    end
    it "should successfully return response with status 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    context "with correct params" do
      before(:each) do
        post :create, params: { contact: attributes_for(:contact) }
      end
      it "should successfully return a response with status 200" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end
end
