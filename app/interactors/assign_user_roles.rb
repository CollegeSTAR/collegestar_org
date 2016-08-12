class AssignUserRoles
  include Interactor

  def call
    context.user_params[:role_ids] ||= [] #don't trust the view to supply a role_ids array
    context.role_ids = ( context.user_params[:role_ids] << context.user.roles.non_grantable.ids ).flatten
  end
end
