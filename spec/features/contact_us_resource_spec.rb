require 'spec_helper'

RSpec.feature 'Contact Us Resource' do
  let(:admin) { create(:admin_user) } 
  let(:unread_contact) { create(:contact, status: 'unread') }
  let(:read_contact) { create(:contact, status: 'read') }

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
      before(:each) do
        check 'contact_send_copy'
      end
      scenario "user submits an inquiry" do
        ActiveJob::Base.queue_adapter = :test
        expect{ click_button "Submit your inquiry" }.to enqueue_job(ActionMailer::DeliveryJob)
      end
    end

    context 'user does not select send_copy' do
      scenario 'user submits an inquiry' do
        ActiveJob::Base.queue_adapter = :test
        expect{ click_button "Submit your inquiry" }.to_not enqueue_job(ActionMailer::DeliveryJob)
      end
    end
  end

  feature "Display contacts to admin" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Log In"
    end

    scenario "Once a contact is marked read it should not be seen" do
      unread_contact
      read_contact
      visit "/contacts"
      expect(page).to have_content(unread_contact.subject)
      expect(page).to_not have_content(read_contact.subject)
    end
  end

end
