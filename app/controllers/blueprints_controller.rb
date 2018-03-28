class BlueprintsController < ApplicationController

  def index
    @page_content = Page.find_by slug: 'blueprints'
  end

  def show
    @page_content = Page.find_by slug: "blueprints-#{params[:slug]}"
  end

end
