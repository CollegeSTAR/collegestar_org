class VirtualConferencesController < ApplicationController

  def show
    @page_content = Page.guaranteed_find slug: 'virtual-conference'
  end
end
