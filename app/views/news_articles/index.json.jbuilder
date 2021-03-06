json.array!(@news_articles) do |news_article|
  json.extract! news_article, :id, :title, :content, :image_url
  json.url news_article_url(news_article, format: :json)
end
