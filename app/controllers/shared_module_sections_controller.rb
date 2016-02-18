class SharedModuleSectionsController < ApplicationController
  before_action :set_shared_module_section, only: [:edit, :update, :destroy]
  
  def new
    @shared_module_section = UdlModuleSection.new
  end

  def create
    @shared_module_section = UdlModuleSection.new(shared_module_section_params)
    @shared_module_section.slug = @shared_module_section.title.parameterize if @shared_module_section.title
    @shared_module_section.shared = true
    UdlModuleSection.set_shared_section_default_position( section: @shared_module_section )
    if @shared_module_section.save
      redirect_to edit_shared_module_section_path(@shared_module_section), notice: 'Shared Module Section was successfully created.'
    else
      redirect_to root_path
    end
  end 

  def edit
  end

  def update
    if @shared_module_section.update(shared_module_section_params)
      redirect_to edit_shared_module_section_path( @shared_module_section ), notice: "#{@shared_module_section.title} section was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @shared_module_section.destroy
      redirect_to udl_modules_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_module_section
      @shared_module_section = UdlModuleSection.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shared_module_section_params
      params.require(:shared_module_section).permit(:parent, :title, :content)
    end
end
