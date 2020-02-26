FactoryBot.define do
  factory :three_two_one_video do
    sequence(:title) { |n| "The title #{n}" }
    slug { "#{title}".parameterize }
    youtube_id { "U1B6yQXsr0c" }
    caption { "A brief video" }
    description { "The description" }
    notes { "These are the notes for the video!" }
    released { false }

    factory :released_three_two_one_video do
      released { true }
    end
  end
end
