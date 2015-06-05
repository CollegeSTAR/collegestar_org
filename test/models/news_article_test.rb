require 'test_helper'

class NewsArticleTest < ActiveSupport::TestCase

  test "should not save news_article without title" do
    @article = news_articles(:news_article_1)
    @article.title = nil
    assert_not @article.save, "A news article cannot be saved without a title"
  end

  test "should not save news article without slug" do
    @article = news_articles(:news_article_1)
    @article.slug = nil
    assert_not @article.save, "A news article cannot be saved without a slug"
  end

  test "should not save news article without content" do
    @article = news_articles(:news_article_1)
    @article.content = nil
    assert_not @article.save, "A news article cannot be saved without content"
  end

  test "order_by_created_date_and_limit should limit articles returned to 10" do
    @articles = NewsArticle.order_by_created_date_and_limit
    assert_equal @articles.count, 10, "NewsArticle.order_by_created_date_and_limit should limit the returned articles to 10 by default."
  end

  test "order_by_created_date_and_limit should limit articles returned to given limit" do
    @articles = NewsArticle.order_by_created_date_and_limit(1)
    assert_equal @articles.count, 1, "NewsArticle.order_by_created_date_and_limit should limit the returned articles to the supplied limit."
  end
end
