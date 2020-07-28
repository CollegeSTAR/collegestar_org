FactoryBot.define do
  factory :virtual_conference_proposal do
    sequence( :name ) { |n| "John Smith#{n}" }
    sequence( :email) { |n| "john.smith#{n}@example.com" }
    presentation_theme{ "The theme of the presentation" }
    sequence( :presentation_title ) { |n| "The title of the presentation" }
    presentation_description{ "The description of the presentation" }
    presentation_takeaway{ "The takeaway from the presenation" }
  end
end
