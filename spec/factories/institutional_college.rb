FactoryBot.define do
  
  factory :institutional_college do
    name "The College of Learning"
    slug "the-college-of-learning"
    mail_stop "123"

    campus

    factory :institutional_college_with_departments do
      after(:create) do |college|
        create(:institutional_department, institutional_unit: college)
      end
    end
  end
end
