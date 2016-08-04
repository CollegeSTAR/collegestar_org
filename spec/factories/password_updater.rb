FactoryGirl.define do
  factory :password_updater do
    current_password { "current_password" }
    new_password "some_new_password"
    new_password_confirmation "some_new_password"
  end
end
