class VirtualConference::ZoomController < ApplicationController

  def show
    @page_content = Page.guaranteed_find slug: 'virtual-conference-zoom'
  end
end
