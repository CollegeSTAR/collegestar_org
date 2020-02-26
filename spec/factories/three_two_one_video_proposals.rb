FactoryBot.define do
  factory :three_two_one_video_proposal do
    token { SecureRandom.urlsafe_base64(nil, false) }
    sequence(:first_name) { |n| "First Name#{n}" }
    sequence(:last_name) { |n| "Last Name#{n}" }
    email { "#{last_name}.#{first_name}@example.com" }
    sequence(:institution) { |n| "Institution ##{n}" }
    sequence(:title) { |n| "Three Two One Video ##{n}"}
    instructional_practice { "This is the instructional practice" }
  end
end
