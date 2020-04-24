class AddSlugToNewsArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :news_articles, :slug, :string
  end
end
