require 'rails_helper'
require 'json'

RSpec.describe "SendGrid Webhook" do

  describe "Creates a webhook entry" do
    it "returns 201 for new entry" do
      body = {
        "_json": [
          {
            test: "data"
          },
          {
            test2: "more data"
          }
        ]
      }

      headers = {
        "ACCEPT" => "application/json"
      }
      post "/api/v1/sendgrid-events", params: {"_json" => [{test: "this is the test"}]}, headers: headers

      expect(response).to have_http_status(:created)
    end

    it "returns 422 if _json is not present" do
      headers = {
        "ACCEPT" => "application/json"
      }
      post "/api/v1/sendgrid-events", params: {not_json: {}}, headers: headers

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
