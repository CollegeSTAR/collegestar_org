class AddFeatureExcerptAndSideBarExcerptToNewsArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :news_articles, :feature_excerpt, :text
    add_column :news_articles, :sidebar_excerpt, :text
  end
end
