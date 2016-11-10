class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update]
  
  def index
    @pages = Page.all
    authorize @pages
  end

  def edit
    authorize @page
  end

  def update
    authorize @page
    @page.update( page_params )
    redirect_to edit_page_path @page
  end

  def new
    @page = Page.new
    authorize @page
  end

  def create
    @page = Page.new( page_params )
    authorize @page

    @page.slug = @page.slug.parameterize
    if @page.save
      redirect_to edit_page_path( @page ), notice: "Page content created successfully."
    else
      render :new
    end
  end

  private

  def set_page
    @page = Page.find_by( slug: params[:slug] )
  end

  def page_params
    params.require(:page).permit(:title, :slug, :text)    
  end
end
