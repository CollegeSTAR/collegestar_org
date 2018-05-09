FactoryBot.define do
  factory :contact do
    name "Tanner Jones"
    email "jonesjoe@ecu.edu"
    sequence(:subject) { |n|  "This is a test email subject #{n}" }
    sequence(:message) { |n|  "This is my test email message #{n}." }
    send_copy 0
  end
end
