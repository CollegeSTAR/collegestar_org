class CampusesController < ApplicationController
  before_action :set_campus, only: [:show, :edit, :update, :destroy]

  # GET /campuses
  # GET /campuses.json
  def index
    @news_articles = NewsArticle.order_by_created_date_and_limit
    @campuses = Campus.order(name: :asc)
    authorize @campuses
  end

  # GET /campuses/1
  # GET /campuses/1.json
  def show
    authorize @campus
  end

  # GET /campuses/new
  def new
    @campus = Campus.new
    authorize @campus
  end

  # GET /campuses/1/edit
  def edit
    authorize @campus
  end

  # POST /campuses
  # POST /campuses.json
  def create
    @campus = Campus.new(campus_params)
    @campus.slug ||= @campus.name.parameterize if @campus.name
    authorize @campus
    if @campus.save
      redirect_to @campus, notice: 'Campus was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /campuses/1
  # PATCH/PUT /campuses/1.json
  def update
    authorize @campus
    if @campus.update(campus_params)
      redirect_to @campus, notice: 'Campus was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /campuses/1
  # DELETE /campuses/1.json
  def destroy
    authorize @campus
    @campus.destroy
    redirect_to campuses_url, notice: 'The campus was removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campus
      @campus = Campus.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campus_params
      params.require(:campus).permit(:name, :slug, :abbreviation, :institution_type, :director_id, :website_url, :address_1, :address_2, :city, :state, :zip, :image)
    end
end
