require 'spec_helper'

RSpec.feature 'Contact Us Resource' do
  
  feature 'submit a request' do
    before(:each) do
      visit "/contact-us"
      fill_in "Name", with: "John Smith"
      fill_in "Email", with: "john.smith@example.com"
      fill_in "Subject", with: "My request subject"
      fill_in "Message", with: "My request message"
    end

    scenario 'user submits an inquiry via the contact-us form' do
      expect{ click_button "Submit your inquiry" }.to change(Contact, :count).by(1)
    end

    context 'user selects send_copy' do
      scenario 'user submits an inquiry' do
        check 'contact_send_copy'
        
        expect{ click_button "Submit your inquiry" }.to change{ ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'user does not select send_copy' do
      scenario 'user submits an inquiry' do
        expect{ click_button "Submit your inquiry" }.to_not change{ ActionMailer::Base.deliveries.count }
      end
    end
  end

end
