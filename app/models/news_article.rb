class NewsArticle < ActiveRecord::Base
  validates :title, presence: :true, uniqueness: :true
  validates :slug, presence: :true, uniqueness: :true
  validates :content, presence: :true

  def self.order_by_created_date_and_limit(limit = 10)
    articles = limit(limit).order(created_at: :desc)

  end

  def to_param
    slug
  end
end
