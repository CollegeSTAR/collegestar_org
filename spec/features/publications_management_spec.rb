require 'spec_helper'

RSpec.feature "Publications Management" do

  let(:pub_page) { create(:publications_page) }
  scenario "Visit /publications-and-resoures" do
    visit "/#{pub_page.slug}"

    expect(page).to have_text(pub_page.title)
    expect(page).to have_text(pub_page.text)
  end
end
