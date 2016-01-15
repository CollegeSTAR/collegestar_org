class UdlModuleSectionsController < ApplicationController
  before_action :set_section, only: [ :edit, :update, :destroy]
  before_action :set_module

  def index
    @udl_module_sections = UdlModuleSection.all  
  end

  def new
    @udl_module_section = UdlModuleSection.new
    @udl_module_section.parent = params[:parent]
  end

  def create
    @udl_module_section = UdlModuleSection.create(section_params)
    @udl_module_section.slug ||= @udl_module_section.title.parameterize if @udl_module_section.title
    @udl_module_section.set_position
    if @udl_module_section.save
      @udl_module.sections << @udl_module_section
      @udl_module.save
      redirect_to edit_udl_module_section_path(udl_module_slug: @udl_module.slug, slug: @udl_module_section.slug), notice: "#{@udl_module_section.title} successfully created."
    end
  end

  def edit
  end

  def update
    @udl_module_section.update(section_params)
    redirect_to edit_udl_module_section_path(udl_module_slug: @udl_module.slug, slug: @udl_module_section.slug), notice: "#{@udl_module_section.title} successfully updated."
  end

  def destroy
    @udl_module_section.destroy
    redirect_to udl_module_path(@udl_module), notice: "Section deleted successfully"
  end

  private
 
  def set_module
    @udl_module = UdlModule.find_by slug: params[:udl_module_slug]
  end

  def set_section
    @udl_module_section = UdlModuleSection.find_by slug: params[:slug]
  end

  def section_params
    params.require(:udl_module_section).permit(:title, :content, :parent, :position)
  end
end
