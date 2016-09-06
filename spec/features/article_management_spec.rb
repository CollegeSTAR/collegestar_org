require 'spec_helper'

RSpec.feature "Article Management" do

  feature "add section to article" do
    let(:news_article) { create(:news_article) }
    let(:news_article_admin) { create(:news_articles_admin_user) }
    before(:each) do 
      #login
      visit "/login"
      fill_in "Email", with: news_article_admin.email
      fill_in "Password", with: news_article_admin.password
      click_button "Log In"
    end
    
    context "with a title and with content" do
      scenario "add news article" do
        visit "/news-article/new"
        fill_in "Title", with: "This is the article title"
        fill_in "Content", with: "This is the article content"
        fill_in "Excerpt", with: "This is the article excerpt"
        fill_in "Image url", with: "This is the article image"
        click_button "Create News article"
        expect(page).to have_text("Article was successfully created.")
      end
    end
    context "without a title and content" do
      scenario "add news article" do
        visit "/news-article/new"
        fill_in "Excerpt", with: "This is the article excerpt"
        fill_in "Image url", with: "This is the article image"
        click_button "Create News article"
        expect(page).to_not have_text("Article was successfully created.")
        expect(page).to have_css(".field_with_errors")
      end
    end
  end
end