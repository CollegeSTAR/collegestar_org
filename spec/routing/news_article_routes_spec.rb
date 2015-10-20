require 'spec_helper'

RSpec.describe NewsArticlesController do
  describe 'news articles routes' do
    it 'get: /news-article/new' do
      expect(get('/news-article/new')).to route_to('news_articles#new')
    end
    it 'get: /news' do
      expect(get('/news')).to route_to('news_articles#index')
    end
    it 'post: /news' do
      expect(post('/news')).to route_to('news_articles#create')
    end
    it 'get: /news/test-slug' do
      expect(get('/news/test-slug')).to route_to('news_articles#show', slug: 'test-slug')
    end
    it 'get: /news/test-slug/edit' do
      expect(get('/news/test-slug/edit')).to route_to('news_articles#edit', slug: 'test-slug')
    end
    it 'patch: /news/test-slug' do
      expect(patch('/news/test-slug')).to route_to('news_articles#update', slug: 'test-slug')
    end
    it 'put: /news/test-slug' do
      expect(put('/news/test-slug')).to route_to('news_articles#update', slug: 'test-slug')
    end
    it 'delete: /news/test-slug' do
      expect(delete('/news/test-slug')).to route_to('news_articles#destroy', slug: 'test-slug')
    end

    context "named routes" do
      it 'get: new_news_article_path' do
        expect(get(new_news_article_path)).to route_to('news_articles#new')
      end
      it 'get: news_articles_path' do
        expect(get(news_articles_path)).to route_to('news_articles#index')
      end
      it 'post: news_articles_path' do
        expect(post(news_articles_path)).to route_to('news_articles#create')
      end
      it 'get: edit_news_article_path(test-slug)' do
        expect(get(edit_news_article_path('test-slug'))).to route_to('news_articles#edit', slug: 'test-slug')
      end
      it 'get: news_article_path(test-slug)' do
        expect(get(news_article_path('test-slug'))).to route_to('news_articles#show', slug: 'test-slug')
      end
      it 'patch: news_article_path(test-slug)' do
        expect(patch(news_article_path('test-slug'))).to route_to('news_articles#update', slug: 'test-slug')
      end
      it 'put: news_article_path(test-slug)' do
        expect(put(news_article_path('test-slug'))).to route_to('news_articles#update', slug: 'test-slug')
      end
      it 'delete: news_article_path(test-slug)' do
        expect(delete(news_article_path('test-slug'))).to route_to('news_articles#destroy', slug: 'test-slug')
      end
    end
  end
end
