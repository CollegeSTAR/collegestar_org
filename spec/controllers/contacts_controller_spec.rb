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
    it "should render the index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "#create" do
    context "with correct params" do
      before(:each) do
        post :create, contact: attributes_for(:contact)
      end
      it "should successfully return a response with status 200" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "should render the sent template" do
        expect(response).to render_template(:sent)
      end
    end
    context "with incorrect params" do
      it "should not be valid without a name" do
        post :create, contact: attributes_for(:contact, name: nil)
        expect(response).to render_template(:new)
      end
    end
  end
end
