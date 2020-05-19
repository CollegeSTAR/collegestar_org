class ThinkUdlPodcastController < ApplicationController
  
  def index
    @page_content = Page.guaranteed_find slug: 'think-udl-podcast'
  end
end
