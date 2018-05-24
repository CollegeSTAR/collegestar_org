require 'spec_helper'

RSpec.feature 'News Letters' do
  let(:sub_attrs) { attributes_for(:news_letter_subscription) }  
  feature 'Visit News Letters Subscription' do
    scenario 'User visits new subscription page' do
      visit '/news-letters/subscriptions/new'
      
      select 'Mr.', from: 'news_letter_subscription_title'
      fill_in 'news_letter_subscription_first_name', with: sub_attrs[:first_name]
      fill_in 'news_letter_subscription_last_name', with: sub_attrs[:last_name]
      fill_in 'news_letter_subscription_email', with: sub_attrs[:email]
      fill_in 'news_letter_subscription_company', with: sub_attrs[:company]

      check 'news_letter_subscription_case_studies'
      check 'news_letter_subscription_research'

      click_button 'Subscribe'

      expect(page).to have_content('News letter subscription successful.')
    end

    context 'Without email address' do
      scenario 'User visits new subscription page' do
        visit '/news-letters/subscriptions/new'
        
        select 'Mr.', from: 'news_letter_subscription_title'
        fill_in 'news_letter_subscription_first_name', with: sub_attrs[:first_name]
        fill_in 'news_letter_subscription_last_name', with: sub_attrs[:last_name]
        fill_in 'news_letter_subscription_company', with: sub_attrs[:company]

        check 'news_letter_subscription_case_studies'
        check 'news_letter_subscription_research'

        click_button 'Subscribe'

        expect(page).to have_content("Email can't be blank")
      end
    end
  end
end
