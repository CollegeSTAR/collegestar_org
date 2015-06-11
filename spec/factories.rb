FactoryGirl.define do 
  factory :news_article do
    sequence( :title ) { |n| "news article #{n}" }
    sequence( :slug ) { |n| "news-article-#{n}" }
    content "This is the content of this article."
  end

  factory :campus do 
    sequence( :name ) { |n| "Campus #{n}" }
    sequence( :slug ) { |n| "campus-#{n}" }
    sequence( :abbreviation ) { |n| "c#{n}" }
    institution_type "university"
    address_1 "1000 AnyStreet"
    city "AnyPlace"
    state "NC"
    zip "12345"
  end

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
