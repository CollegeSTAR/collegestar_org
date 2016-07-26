class UdlModuleSectionPolicy < UdlModulePolicy
   
  def destroy?
    edit?
  end
end
