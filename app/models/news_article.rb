class NewsArticle < ActiveRecord::Base
  validates_presence_of :slug

  def self.order_by_created_date_and_limit(limit = 10, offset = 0)
    articles = limit(limit)
    articles = articles.offset(offset)
    articles = articles.order(created_at: :desc)
  end

  def to_param
    slug
  end
end
