require 'rails_helper'

RSpec.describe ContactsController do
  describe "#index" do
    before(:each) do
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
