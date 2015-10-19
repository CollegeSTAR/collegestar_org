FactoryGirl.define do
  factory :event do
    sequence( :name ) { |n| "Event name #{n}" }
    sequence( :slug ) { |n| "event-slug-#{n}" }
    registration_open_datetime { Time.now }
    registration_close_datetime { Time.now + 1.week }
    start_datetime { Time.now + 4.weeks }
    end_datetime { Time.now + 4.weeks + 2.days}
    address "123 Anywhere"
    city "AnyPlace"
    state "NC"
    zip_code "12345"
  end
end
