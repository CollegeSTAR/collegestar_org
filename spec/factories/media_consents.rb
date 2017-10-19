FactoryGirl.define do
  factory :media_consent do
    first_name "John"
    last_name "Smith"
    image_file_name 'upload.png'
    image_content_type 'image/png'
    image_file_size '1024'
    consent true
  end
end
