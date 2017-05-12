class FindUserModules
  include Interactor

  def call
    if context.user.has_role?( [:admin, :modules_admin] )
      context.released_modules = context.module_klass.released
      context.unreleased_modules = context.module_klass.unreleased
    elsif context.user.has_role?( :modules_author )
      context.released_modules = context.user.released_modules
      context.unreleased_modules = context.user.unreleased_modules
    else
      context.released_modules = []
      context.unreleased_modules = []
      context.fail!(error: "User does not have access to UDL Module dashboard")
    end
  end
end
