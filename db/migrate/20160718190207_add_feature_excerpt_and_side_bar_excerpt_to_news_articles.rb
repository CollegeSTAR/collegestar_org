class AddFeatureExcerptAndSideBarExcerptToNewsArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :feature_excerpt, :text
    add_column :news_articles, :sidebar_excerpt, :text
  end
end
