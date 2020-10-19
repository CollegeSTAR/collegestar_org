class VirtualConference::ToolkitController < ApplicationController

  def show
    @page_content = Page.guaranteed_find slug: 'virtual-conference-toolkit'
  end
end
