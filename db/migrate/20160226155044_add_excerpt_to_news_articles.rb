class AddExcerptToNewsArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :news_articles, :excerpt, :text
  end
end
