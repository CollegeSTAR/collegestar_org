class MainController < ApplicationController

  before_action :load_news_articles

  def home
    @campuses = Campus.find_by_featured(3)
  end

  def about
  end

  def students
  end

  def faculty
    load_released_modules
  end

  def contact
  end

  def terms
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

  def load_released_modules
    @udl_modules = UdlModule.where( released: 1)
  end
end
