module UdlModuleSectionHelper
 def module_admin?(user)
    user.roles.each do |role|
      return true if ['admin','modules_admin'].include? role.name
    end
    false
  end
end
