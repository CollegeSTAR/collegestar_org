FactoryGirl.define do
  factory :basic_role, class: Role do
    name "basic"
    action "manage"
    subject "user"
    conditions "id"
  end

  factory :admin_role, class: Role do
    name "admin"
    action "manage"
    subject "all"
  end

  factory :event_admin_role, class: Role do
    name "event_admin"
    action "manage"
    subject "event"
  end
end
