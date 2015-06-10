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
    state "AnyState"
    zip "12345"
  end
end
