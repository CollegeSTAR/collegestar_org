class UserInstitutionLookupJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @user = User.find user_id
    @user.department = 'Updated with a working sidekiq!'
    @user.save
  end
end
