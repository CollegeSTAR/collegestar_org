class AddExcerptToNewsArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :excerpt, :text
  end
end
