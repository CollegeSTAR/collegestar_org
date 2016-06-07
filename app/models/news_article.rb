class NewsArticle < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :content, presence: true
  validates :feature_article, uniqueness: true, if: :feature_article?

  scope :non_featured, -> { where(feature_article: false) }
  scope :non_featured_reverse_date_order, -> { where(feature_article: false).order(created_at: :desc) }

  def self.order_by_created_date_and_limit(limit = 10)
    articles = where(feature_article: false).limit(limit).order(created_at: :desc)
  end

  def self.all_reverse
    articles = non_featured.order(created_at: :desc)
  end

  def to_param
    slug
  end
end
