class UniversalDesignForLearningController < ApplicationController
  before_action :set_udl_resource, only: [ :show, :edit, :update, :destroy]

  def index
    @published_udl_resources = UniversalDesignForLearningResource.published
    @unpublished_udl_resources = UniversalDesignForLearningResource.unpublished
    authorize UniversalDesignForLearningResource
  end

  def show
    authorize @udl_resource
  end

  def new
    authorize UniversalDesignForLearningResource
    @udl_resource = UniversalDesignForLearningResource.new
  end

  def create
    authorize UniversalDesignForLearningResource
    @udl_resource = UniversalDesignForLearningResource.new( universal_design_for_learning_resource_params )
    @udl_resource.slug = @udl_resource.title.parameterize
    if @udl_resource.save
      redirect_to universal_design_for_learning_path( @udl_resource ), notice: "Successfully created Universal Design for Learning Resource."
    else
      render :new
    end
  end
  
  def edit
    authorize @udl_resource
  end

  def update
    authorize @udl_resource
    if @udl_resource.update( universal_design_for_learning_resource_params )
      redirect_to universal_design_for_learning_path( @udl_resource ), notice: "Successfully updated Universal Design for Learning Resource."
    else
      render :edit
    end
  end

  private

  def set_udl_resource
    @udl_resource = UniversalDesignForLearningResource.find_by slug: params[:slug]
  end

  def universal_design_for_learning_resource_params
    params.require(:universal_design_for_learning_resource).permit(:title, :published, :description, :content)
  end
end
