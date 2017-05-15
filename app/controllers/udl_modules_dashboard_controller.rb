class UdlModulesDashboardController < ApplicationController
  
  def index
    authorize( UdlModule, :dashboard? )
    result = FindUserModules.call( user: current_user, module_klass: UdlModule )
    @released_modules = result.released_modules
    @unreleased_modules = result.unreleased_modules
  end
end
