FactoryBot.define do
  factory :virtual_conference_proposal do
    name{ "John Smith" }
    email{ "john.smith@example.com" }
    presentation_theme{ "The theme of the presentation" }
    presentation_title{ "The title of the presentation" }
    presentation_description{ "The description of the presentation" }
    presentation_takeaway{ "The takeaway from the presenation" }
  end
end
