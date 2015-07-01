class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @community = Community.new
  end

  def edit
  end

  def create
    @community = Community.new(community_params)
    @community.slug ||= @community.name.parameterize if @community.name
    if @community.save
      redirect_to @community
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private
    
    def set_community
      @community = Community.find_by(slug: params[:slug])
    end

    def community_params
      params.require(:community).permit(:name, :description)
    end
end
