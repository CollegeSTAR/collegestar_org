class Page < ActiveRecord::Base

  validates_presence_of :title, :slug, :text
  validates_uniqueness_of :slug

  def self.guaranteed_find( params = {} )
    page = self.find_by slug: params[:slug]
    if !page
      page = NullPage.new
    end
    page
  end

  def to_param
    slug
  end
end
