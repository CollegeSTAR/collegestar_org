class PublicationsController < ApplicationController
  
  def show
    @page_content = Page.guaranteed_find slug: 'publications-and-resources'
  end
end
