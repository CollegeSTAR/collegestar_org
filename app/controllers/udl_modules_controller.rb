class UdlModulesController < ApplicationController
  before_action :set_udl_module, only: [:show, :edit, :update, :destroy]

  # GET /udl_modules
  def index
    @page_content = Page.guaranteed_find slug: 'modules'
    @released_modules = UdlModule.released
    @unreleased_modules = UdlModule.unreleased
    authorize @released_modules
    @shared_module_sections = UdlModuleSection.shared_sections
  end

  # GET /udl_modules/1
  def show
    authorize @udl_module
  end

  # GET /udl_modules/new
  def new
    @udl_module = UdlModule.new
    authorize @udl_module
  end

  # GET /udl_modules/1/edit
  def edit
    authorize @udl_module
  end

  # POST /udl_modules
  def create
    authorize UdlModule
    result = CreateUdlModule.call( user: current_user, udl_module_params: udl_module_params, params: params )
    @udl_module = result.udl_module  
    
    if result.success?
      redirect_to @udl_module, notice: 'Udl module was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /udl_modules/1
  def update
    authorize @udl_module
      if @udl_module.update(udl_module_params)
        redirect_to edit_udl_module_path(@udl_module), notice: 'Udl module was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /udl_modules/1
  def destroy
    authorize @udl_module
    if @udl_module.destroy
      redirect_to udl_modules_url, notice: 'Udl module was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_udl_module
      @udl_module = UdlModule.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def udl_module_params
      params.require(:udl_module).permit(:title, :slug, :sub_heading, :udl_representation, :udl_action_expression, :udl_engagement, :title_image, :description, :released, :release_date, :latest_revision_date)
    end

    def create_module_pages
    end
end
