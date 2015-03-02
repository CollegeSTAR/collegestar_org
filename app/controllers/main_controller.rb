class MainController < ApplicationController
  def home
  end

  def about
    @page_title = "About"
  end

  def students
    @page_title = "Students"
  end

  def faculty
    @page_title = "Faculty"
  end

  def contact
    @page_title = "Contact Us"
  end

  def terms
    @page_title = "Terms of Use"
  end

  def site_map
    @page_title = "Site Map"
  end

  def faq
    @page_title = "Frequently Asked Questions"
  end
end
