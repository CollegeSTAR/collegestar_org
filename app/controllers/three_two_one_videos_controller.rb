class ThreeTwoOneVideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  def index
    authorize(ThreeTwoOneVideo)
    @videos = ThreeTwoOneVideo.released
    @unreleased_videos = ThreeTwoOneVideo.unreleased
  end

  def show
    authorize @video
  end

  def new
    authorize(ThreeTwoOneVideo)
    @video = ThreeTwoOneVideo.new
  end

  def create
    @video = ThreeTwoOneVideo.new video_params
    authorize @video
    @video.slug = @video.title.parameterize
    @video.save
    if @video.persisted?
      flash[:notice] = 'Successfully created Three Two One Video.'
      redirect_to three_two_one_video_path(@video)
    else
      flash[:errors] = "There were errors creating your video"
      render :new
    end
  end

  def edit
    authorize @video
  end

  def update
    authorize @video
    if @video.update( video_params )
      flash[:notice] = 'Successfully updated Three Two One Video.'
      redirect_to three_two_one_video_path(@video)
    else
      flash[:errors] = @video.errors.full_messages
    end
  end

  private

  def set_video
    @video = ThreeTwoOneVideo.find_by slug: params[:slug]
  end

  def video_params
    params.require(:three_two_one_video).permit(:title, :youtube_id, :caption, :notes, :screenshot, :description, :released)
  end
end
