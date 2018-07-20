require 'spec_helper'

RSpec.feature "Frequently Asked Questions Management" do
  
  let(:admin) { create(:admin_user) }
  let(:faq) { create(:frequently_asked_question) }
  let(:faq_attrs) { attributes_for(:frequently_asked_question) }

  before(:each) do
    visit "/login"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log In"
  end

  feature "Create new question" do
    scenario "Visit new faq page" do
      visit "/frequently-asked-questions/new"
      fill_in "frequently_asked_question_question", with: faq_attrs[:question]
      fill_in "frequently_asked_question_answer", with: faq_attrs[:answer]
      click_button "frequently_asked_questions_submit"

      expect(page).to have_content("Frequently Asked Question created successfully.")
      expect(page).to have_content(faq_attrs[:question])
      expect(page).to have_content(faq_attrs[:answer])
    end
  end

  feature "Edit existing question" do
    scenario "visit existing question" do
      faq
      visit "/frequently-asked-questions"
      click_on "edit_frequently_asked_question_#{faq.id}"
      fill_in "frequently_asked_question_answer", with: "The new answer"
      click_button "frequently_asked_questions_submit"

      expect(page).to have_content("FAQ question successfully updated.")
      expect(page).to have_content("The new answer")
    end
  end
end
