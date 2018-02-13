class MainController < ApplicationController

  before_action :load_news_articles

  def home
    @page_content = Page.guaranteed_find slug: 'home'
    @campuses = Campus.find_by_featured(3)
  end

  def about
    @page_content = Page.guaranteed_find slug: 'about'
  end

  def students
  end

  def stepp_program
  end

  def faculty
    @page_content = Page.guaranteed_find slug: 'instructional-supports'
  end

  def contact
  end

  def terms
    @page_content = Page.guaranteed_find slug: 'terms'
  end

  def faq
  end

  def supporters
  end

  def partners
  end

  private

  def load_news_articles
    @news_articles = NewsArticle.order_by_created_date_and_limit
  end

end
