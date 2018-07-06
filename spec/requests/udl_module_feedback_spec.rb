require 'spec_helper'

RSpec.describe "Udl Module Feedback" do
  let(:udl_module) { create(:udl_module) }
  let(:user) { create(:user) }

  it "Creates a new feedback resource" do
    headers = {
      "ACCEPT" => "application/json"
    }

    post "/api/v1/module-feedback", params: {udl_module_feedback: { udl_module: udl_module.slug, user: user, resource_was_helpful: true }}, headers: headers
    
    expect(response.body).to include(udl_module.title)
    expect(response).to have_http_status(:created)
  end

  it "Creates a new feedback resource with false resource_was_helpful" do
    headers = {
      "ACCEPT" => "application/json"
    }

    post "/api/v1/module-feedback", params: {udl_module_feedback: { udl_module: udl_module.slug, user: user, resource_was_helpful: false }}, headers: headers
    
    expect(response.body).to include(udl_module.title)
    expect(response).to have_http_status(:created)
    expect(UdlModuleFeedback.last.resource_was_helpful).to be_falsey
  end

  it "returns 422 if no module is provided" do
    headers = {
      "ACCEPT" => "application/json"
    }

    post "/api/v1/module-feedback", params: {udl_module_feedback: { user: user, resource_was_helpful: true }}, headers: headers   

    expect(response).to have_http_status(:unprocessable_entity)
  end
end
