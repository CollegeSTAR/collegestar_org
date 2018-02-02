class UserModuleHistoryController < ApplicationController
  def index
    @assessments = UserModuleAssessment.where( user: current_user.id )
  end

  def show
  end
end
