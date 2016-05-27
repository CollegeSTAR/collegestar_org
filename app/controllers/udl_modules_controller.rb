class UdlModulesController < ApplicationController
  load_and_authorize_resource except: [:show, :index]
  before_action :set_udl_module, only: [:show, :edit, :update, :destroy]

  # GET /udl_modules
  # GET /udl_modules.json
  def index
    @udl_modules = UdlModule.all
    @shared_module_sections = UdlModuleSection.shared_sections
  end

  # GET /udl_modules/1
  # GET /udl_modules/1.json
  def show
  end

  # GET /udl_modules/new
  def new
    @udl_module = UdlModule.new
  end

  # GET /udl_modules/1/edit
  def edit
  end

  # POST /udl_modules
  # POST /udl_modules.json
  def create
    @udl_module = UdlModule.new(udl_module_params)
    @udl_module.slug ||= @udl_module.title.parameterize if @udl_module.title
    @udl_module.authors << current_user
    if params[:author_is_contributing_faculty]
      @udl_module.faculty << current_user
    end

    respond_to do |format|
      if @udl_module.save    
        shared_sections = UdlModuleSection.shared_sections
        [
          :introduction, 
          :udl_principles, 
          :instructional_practice, 
          :literature_base, 
          :learn_more, 
          :references_and_resources
        ].each do |page|
          shared_sections[page].each do |section|
            @udl_module.add_section( section )
          end
        end
        format.html { redirect_to @udl_module, notice: 'Udl module was successfully created.' }
        format.json { render :show, status: :created, location: @udl_module }
      else
        format.html { render :new }
        format.json { render json: @udl_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /udl_modules/1
  # PATCH/PUT /udl_modules/1.json
  def update
    respond_to do |format|
      if @udl_module.update(udl_module_params)
        format.html { redirect_to edit_udl_module_path(@udl_module), notice: 'Udl module was successfully updated.' }
        format.json { render :show, status: :ok, location: @udl_module }
      else
        format.html { render :edit }
        format.json { render json: @udl_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /udl_modules/1
  # DELETE /udl_modules/1.json
  def destroy
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
      params.require(:udl_module).permit(:title, :slug, :sub_heading, :udl_representation, :udl_action_expression, :udl_engagement, :description, :released, :release_date, :latest_revision_date)
    end

    def create_module_pages
    end
end
