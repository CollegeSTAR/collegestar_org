module UdlModuleHelper
  def get_udl_trio_class(udl_module)
    class_name = ""
   class_name = 'udl-rep' if udl_module.udl_representation && !udl_module.udl_action_expression && !udl_module.udl_engagement
   class_name = 'udl-rep-exp' if udl_module.udl_representation && udl_module.udl_action_expression && !udl_module.udl_engagement
   class_name = 'udl-rep-eng' if udl_module.udl_representation && !udl_module.udl_action_expression && udl_module.udl_engagement
   class_name = 'udl-eng' if !udl_module.udl_representation && !udl_module.udl_action_expression && udl_module.udl_engagement
   class_name = 'udl-eng-exp' if !udl_module.udl_representation && udl_module.udl_action_expression && udl_module.udl_engagement
   class_name = 'udl-exp' if !udl_module.udl_representation && udl_module.udl_action_expression && !udl_module.udl_engagement
   class_name = 'udl-all' if udl_module.udl_representation && udl_module.udl_action_expression && udl_module.udl_engagement
   class_name = 'udl-none' if !udl_module.udl_representation && !udl_module.udl_action_expression && !udl_module.udl_engagement
   class_name
  end

  def module_admin?(user)
    user.roles.each do |role|
      return true if ['admin','modules_admin'].include? role.name
    end
    false
  end
end
