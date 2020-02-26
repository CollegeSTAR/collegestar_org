FactoryBot.define do
  factory :redesign_summary_attachment do
    redesign_summary_uuid { "e29f16e3-31df-413f-80b9-f568c2b18088" }
    attachment_file_name { "redesign_summmary_test_attachment.jpg" }
    attachment_content_type { "image/jpeg" }
    attachment_file_size { 62792 }
  end
end
