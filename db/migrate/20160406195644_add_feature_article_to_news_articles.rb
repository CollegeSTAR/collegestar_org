class AddFeatureArticleToNewsArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :feature_article, :boolean, default: false
  end
end
