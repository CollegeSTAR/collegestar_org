FactoryGirl.define do

  factory :dss_contact do
    institution_type 'community_college'
    sequence( :campus_name ) { |n| "Campus #{n}" }
    sequence( :slug ) { |n| "campus-#{n}" }
    dss_office 'Dss Office Name Here'
  end

  factory :community_college_dss_contact, class: DssContact do
    institution_type 'community_college'
    sequence( :campus_name ) { |n| "Campus #{n}" }
    sequence( :slug ) { |n| "campus-#{n}" }
    dss_office 'Dss Office Name Here'
  end  
    
  factory :dss_contact_slug_unique, class: DssContact do
    institution_type 'community_college'
    sequence( :campus_name ) { |n| "Campus #{n}" }
    dss_office 'Dss Office Name Here'
  end

  factory :dss_contact_campus_name_unique, class: DssContact do
    institution_type 'community_college'
    sequence( :slug ) { |n| "campus-#{n}" }
    dss_office 'Dss Office Name Here'
  end
end
