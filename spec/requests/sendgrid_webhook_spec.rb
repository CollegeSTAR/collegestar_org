require 'rails_helper'
require 'json'

RSpec.describe "SendGrid Webhook" do
  let(:sendgrid_post) do
    JSON.generate({
      email: "john.doe@sendgrid.com",
      timestamp: 1337197600,
      "smtp-id" => "<4FB4041F.6080505@sendgrid.com>",
      sg_event_id: "sendgrid_internal_event_id",
      sg_message_id: "sendgrid_internal_message_id",
      event: "processed"
    })
  end

  it "creates a webhook entry" do
    headers = {
      "ACCEPT" => "application/json"
    }
    post "/api/v1/sendgrid-events", params: sendgrid_post, headers: headers

    expect(response).to have_http_status(:created)
  end
end
