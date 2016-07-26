require 'spec_helper'

RSpec.describe NewsArticlePolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:news_articles_admin) { create(:news_articles_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index?, :show? do
    it "grants access to admins" do
      expect(subject).to permit(admin, NewsArticle.new)
    end
    it "grants access to news_article_admins" do
      expect(subject).to permit(news_articles_admin, NewsArticle.new)
    end
    it "grants access to user" do
      expect(subject).to permit(user, NewsArticle.new)
    end
    it "grants access to null_user" do
      expect(subject).to permit(null_user, NewsArticle.new)
    end
  end

  permissions :create?, :new?, :update?, :edit?, :destroy? do
    it "grants access to admins" do
      expect(subject).to permit(admin, NewsArticle.new)
    end
    it "grants access to news_articles_admins" do
      expect(subject).to permit(news_articles_admin, NewsArticle.new)
    end
    it "denies access to users" do
      expect(subject).to_not permit(user, NewsArticle.new)
    end
    it "denies access to null_user" do
      expect(subject).to_not permit(null_user, NewsArticle.new)
    end
  end
end
