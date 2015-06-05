class MainController < ApplicationController
  def home
    @news_articles = NewsArticle.order_by_created_date_and_limit
    @campuses = Campus.find_by_featured(3)
  end

  def about
    @news_articles = NewsArticle.order_by_created_date_and_limit
  end

  def students
  end

  def faculty
  end

  def contact
  end

  def terms
  end

  def site_map
  end

  def faq
  end

  def supporters
  end

  def partners
  end
end
