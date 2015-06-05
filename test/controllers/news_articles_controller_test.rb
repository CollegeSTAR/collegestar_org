require 'test_helper'

class NewsArticlesControllerTest < ActionController::TestCase
  setup do
    @news_article = news_articles(:news_article_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_article" do
    assert_difference('NewsArticle.count') do
      post :create, news_article: { content: @news_article.content, image_url: @news_article.image_url, title: @news_article.title, slug: @news_article.slug}
    end

    assert_redirected_to news_article_path(assigns(:news_article))
  end

  test "should show news_article" do
    get :show, slug: @news_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, slug: @news_article
    assert_response :success
  end

  test "should update news_article" do
    patch :update, slug: @news_article, news_article: { content: @news_article.content, image_url: @news_article.image_url, title: @news_article.title, slug: @news_article.slug }
    assert_redirected_to news_article_path(assigns(:news_article))
  end

  test "should destroy news_article" do
    assert_difference('NewsArticle.count', -1) do
      delete :destroy, slug: @news_article
    end

    assert_redirected_to news_articles_path
  end
end
