class StarLearningCommunitiesController < ApplicationController
  
  def show
    @page = Page.guaranteed_find slug: 'star-learning-communities'
  end
end
