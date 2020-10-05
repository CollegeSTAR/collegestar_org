class VirtualConference::SessionsController < ApplicationController
  
  def index
    @sessions = VirtualConferenceSession.order(:start_time)
  end

  def new
    authorize @session = VirtualConferenceSession.new
  end

  def show
    @session = VirtualConferenceSession.find_by( slug: params[:slug] )
  end

  def edit
    authorize @session = VirtualConferenceSession.find_by( slug: params[:slug] )
  end

  def create
    authorize @session = VirtualConferenceSession.new( session_params )
    @session.slug = @session.title.parameterize
    if @session.save
      redirect_to virtual_conference_session_path(slug: @session)
    else
      render :new
    end
  end

  def update
    authorize @session = VirtualConferenceSession.find_by( slug: params[:slug] )
    if @session.update( session_params)
      redirect_to virtual_conference_session_path slug: @session
    else
      render :edit
    end
  end

  private

  def session_params
    params.require(:virtual_conference_session).
    permit(
      :title,
      :slug,
      :conference_track,
      :description,
      :short_description,
      :meeting_url,
      :start_time,
      :end_time
    )
  end
end
