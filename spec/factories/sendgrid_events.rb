FactoryBot.define do
  factory :sendgrid_event do
    sequence(:email) { |n| "john.doe#{n}@sendgrid.com" }
    timestamp { "1337197600" }
    smtp_id { "<4FB4041F.6080505@sendgrid.com>" }
    sequence(:sg_event_id) { |n| "sendgrid_internal_event_id_#{n}" }
    sequence(:sg_message_id) { |n| "sendgrid_internal_message_id_#{n}" }
    event { "processed" }
  end
end
