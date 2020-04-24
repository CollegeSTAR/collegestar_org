class CreateNewsArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :news_articles do |t|
      t.string :title
      t.text :content
      t.string :image_url

      t.timestamps null: false
    end
  end
end
