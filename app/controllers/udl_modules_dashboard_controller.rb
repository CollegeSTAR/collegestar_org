class UdlModulesDashboardController < ApplicationController
  
  before_action :set_user
  
  def index
    result = FindUserModules.call( user: current_user, module_klass: UdlModule )
    @released_modules = result.released_modules
    @unreleased_modules = result.unreleased_modules
  end

  private

  def set_user
    @user = User.find( params[:profile_id] )
  end
end
