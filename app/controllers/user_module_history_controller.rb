class UserModuleHistoryController < ApplicationController
  def index
    @module_histories = UserModuleHistory.where(user_id: current_user.id)
    authorize @module_histories
    
  end

  def show
    @module_history = UserModuleHistory.find(params[:id])
    authorize @module_history
  end
end
