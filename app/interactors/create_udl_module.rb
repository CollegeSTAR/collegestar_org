class CreateUdlModule
  include Interactor
  
  def call
    udl_module = UdlModule.new( context.udl_module_params )
    udl_module.slug ||= udl_module.title.parameterize if udl_module.title
    udl_module.authors << context.user
    if context.params[:author_is_contributing_faculty]
      udl_module.faculty << context.user
    end

    if udl_module.save
      shared_sections = UdlModuleSection.shared_sections
      UdlModule::PAGES.each do |page|
          shared_sections[page].each do |section|
            udl_module.add_section( section )
          end
        end
      context.udl_module = udl_module
    else
      context.fail!
    end
  end

  def rollback
    context.udl_module.destroy
  end
end
