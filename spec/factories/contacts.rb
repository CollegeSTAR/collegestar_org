FactoryGirl.define do
  factory :contact do #Not an active record model
    name "Tanner Jones"
    email "jonesjoe@ecu.edu"
    subject "This is a test email subject"
    message "This is my test email message."
    send_copy 0
  end
end
