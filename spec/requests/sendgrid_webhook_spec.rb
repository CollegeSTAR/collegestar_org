require 'rails_helper'
require 'json'

RSpec.describe "SendGrid Webhook" do
  let(:sge_attrs) { attributes_for(:sendgrid_event) }
  let(:sendgrid_event) { create(:sendgrid_event) }

  describe "Creates a webhook entry" do
    context "is a new entry" do
      it "returns 201 for new entry" do
        body = {
          email: sge_attrs[:email],
          timestamp: sge_attrs[:timestamp],
          "smtp-id" => sge_attrs[:smtp_id],
          sg_event_id: sge_attrs[:sg_event_id],
          sg_message_id: sge_attrs[:sg_message_id],
          event: sge_attrs[:event]
        }

        headers = {
          "ACCEPT" => "application/json"
        }
        post "/api/v1/sendgrid-events", params: body, headers: headers

        expect(response).to have_http_status(:created)
      end
    end
    context "is a repeat entry" do
      it "returns 202 for a repeat entry" do
        sendgrid_event
        body = {
          email: sendgrid_event.email,
          timestamp: sendgrid_event.timestamp,
          "smtp-id" => sendgrid_event.smtp_id,
          sg_event_id: sendgrid_event.sg_event_id,
          sg_message_id: sendgrid_event.sg_message_id,
          event: sendgrid_event.event
        }

        headers = {
          "ACCEPT" => "application/json"
        }
        post "/api/v1/sendgrid-events", params: body, headers: headers

        expect(response).to have_http_status(:accepted)
      end
    end
    context "Fails SendgridEvent validations" do
      it "returns 422 for a non-valid sendgridEvent" do
        headers = {
          "ACCEPT" => "application/json"
        }
        # SendgridEvents must have an event param to be valid
        post "/api/v1/sendgrid-events", params: {email: sge_attrs[:email]}, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end

      context "sg_event_id is set" do
        it "returns 422 for a non-valid sendgridEvent" do
          headers = {
            "ACCEPT" => "application/json"
          }
          # SendgridEvents must have an event param to be valid
          post(
            "/api/v1/sendgrid-events", 
            params: {
              timestamp: sge_attrs[:timestamp], 
              "smtp-id" => sge_attrs[:smtp_id], 
              sg_event_id: sge_attrs[:sg_event_id],
              sg_message_id: sge_attrs[:sg_message_id],
              event: sge_attrs[:event]
            }, 
            headers: headers
          )

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
