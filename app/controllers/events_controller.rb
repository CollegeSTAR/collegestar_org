class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  # GET /events
  # GET /events.json
  def index
  end

  # GET /events/1
  # GET /events/1.json
  def show
    authorize @event
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.slug ||= @event.name.parameterize if @event.name
    authorize @event
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    authorize @event
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize @event
    @event.destroy
      redirect_to events_url, notice: 'The event was removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :slug, :registration_open_datetime, :registration_close_datetime, :max_registrants, :start_datetime, :end_datetime, :address, :address_2, :city, :state, :zip_code)
    end
end
