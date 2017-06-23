require 'spec_helper'

RSpec.feature "News Articles Manangement" do
  let(:news_article) { create(:news_article) }
  let(:unreleased_news_article) { create(:unreleased_news_article) }
  let(:admin_user) { create(:admin_user) }
  
  feature "displays index of articles" do
    scenario "user visits index page and sees released articles" do
      news_article
      visit "/news"

      expect(page).to have_content(news_article.title)
    end
    scenario "user visits index page and does not see unreleased articles" do
      unreleased_news_article
      visit "/news"

      expect(page).to_not have_content(unreleased_news_article.title)
    end
  end

  feature "displays article" do
    scenario "user views released article" do
      news_article
      visit "/news/#{news_article.slug}"

      expect(page).to have_content(news_article.title)
      expect(page).to have_content(news_article.content)
    end
  end

  feature "create news article" do
    context "with correct permissions" do
      before(:each) do
        #login
        visit "/login"
        fill_in "Email", with: admin_user.email
        fill_in "Password", with: admin_user.password
        click_button 'Log In'
      end
      scenario "user creates news article" do
        title = "This is my title"
        content = "This is my content"
        excerpt = "This is my excerpt"

        visit "/news"
        click_link "Add News Article"

        fill_in "news_article_title", with: title
        fill_in "news_article_content", with: content
        fill_in "news_article_excerpt", with: excerpt
        check "news_article_released"
        click_button "Create News article"

        expect(page).to have_content(title)
        expect(page).to have_content(content)
      end
    end

    context "without correct permissions" do
      scenario "user attempts to create news article " do
        visit "/news-articles/new"

        expect(page).to have_content("Log In")
      end
    end
  end

  feature "edit news article" do
    before(:each) do
      news_article
    end

    context "with correct permissions" do
      before(:each) do
        #login
        visit "/login"
        fill_in "Email", with: admin_user.email
        fill_in "Password", with: admin_user.password
        click_button 'Log In'
      end

      scenario "user edits article" do
        content = "My updated article content"
        visit "/news/#{news_article.slug}/edit"

        fill_in "news_article_content", with: content
        click_button "Update News article"

        expect(page).to have_content(content)
      end

      context "with a title and with content" do
        scenario "add news article" do
          visit "/news-articles/new"
          fill_in "Title", with: "This is the article title"
          fill_in "Content", with: "This is the article content"
          fill_in "Excerpt", with: "This is the article excerpt"
          click_button "Create News article"
          expect(page).to have_text("Article was successfully created.")
        end
      end
      context "without a title and content" do
        scenario "add news article" do
          visit "/news-articles/new"
          fill_in "Excerpt", with: "This is the article excerpt"
          click_button "Create News article"
          expect(page).to_not have_text("Article was successfully created.")
          expect(page).to have_css(".field_with_errors")
        end
      end
    end

    context "without correct permissions" do
      scenario "user attempts to edit article" do
        visit "/news/#{news_article.slug}/edit"

        expect(page).to have_content("Log In")
      end
    end
  end
end
