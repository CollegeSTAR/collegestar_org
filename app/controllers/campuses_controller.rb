class CampusesController < ApplicationController
  before_action :set_campuse, only: [:show, :edit, :update, :destroy]

  # GET /campuses
  # GET /campuses.json
  def index
    @campuses = Campuse.all
  end

  # GET /campuses/1
  # GET /campuses/1.json
  def show
  end

  # GET /campuses/new
  def new
    @campuse = Campuse.new
  end

  # GET /campuses/1/edit
  def edit
  end

  # POST /campuses
  # POST /campuses.json
  def create
    @campuse = Campuse.new(campuse_params)

    respond_to do |format|
      if @campuse.save
        format.html { redirect_to @campuse, notice: 'Campuse was successfully created.' }
        format.json { render :show, status: :created, location: @campuse }
      else
        format.html { render :new }
        format.json { render json: @campuse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campuses/1
  # PATCH/PUT /campuses/1.json
  def update
    respond_to do |format|
      if @campuse.update(campuse_params)
        format.html { redirect_to @campuse, notice: 'Campuse was successfully updated.' }
        format.json { render :show, status: :ok, location: @campuse }
      else
        format.html { render :edit }
        format.json { render json: @campuse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campuses/1
  # DELETE /campuses/1.json
  def destroy
    @campuse.destroy
    respond_to do |format|
      format.html { redirect_to campuses_url, notice: 'Campuse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campuse
      @campuse = Campuse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campuse_params
      params.require(:campuse).permit(:name, :image, :website, :address_1, :address_2, :director)
    end
end
