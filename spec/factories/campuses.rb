FactoryBot.define do
  factory :campus do 
    sequence( :name ) { |n| "Campus #{n}" }
    sequence( :slug ) { |n| "campus-#{n}" }
    sequence( :abbreviation ) { |n| "c#{n}" }
    sequence( :history ) { |n| "Campus-#{n}'s history!" }
    institution_type { "university" }
    address_1 { "1000 AnyStreet" }
    address_2 { "" }
    city { "AnyPlace" }
    state { "NC" }
    zip { "12345" }
  end
end
