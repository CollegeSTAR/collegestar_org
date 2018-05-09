FactoryBot.define do
  factory :news_article do
    sequence( :title ) { |n| "news article #{n}" }
    sequence( :slug ) { |n| "news-article-#{n}" }
    content "This is the content of this article."
    excerpt "This is the excerpt from the article."
    feature_article false
    released true
  end  
  
  factory :unreleased_news_article, class: NewsArticle do
    sequence( :title ) { |n| "news article #{n}" }
    sequence( :slug ) { |n| "news-article-#{n}" }
    content "This is the content of this article."
    excerpt "This is the excerpt from the article."
    feature_article false
    released false
  end

end
