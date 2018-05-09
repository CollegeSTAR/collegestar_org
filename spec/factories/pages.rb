FactoryBot.define do
  factory :page do
    title "This is my title"
    slug "this-is-my-slug"
    text "This is the content."

    factory :blueprints_page do
      title "College STAR Blueprints"
      slug "blueprints"
    end
  end
end
