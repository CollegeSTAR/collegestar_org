class AddFeatureArticleToNewsArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :news_articles, :feature_article, :boolean, default: false
  end
end
