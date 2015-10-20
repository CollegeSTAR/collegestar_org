require 'spec_helper'

RSpec.describe ContactsController do
  describe 'contact us routes' do
    it 'get: /contact-us' do
      expect(get('/contact-us')).to route_to('contacts#new')
    end
    it 'get: /contacts' do
      expect(get('/contacts')).to route_to('contacts#index')
    end
    it 'post: /contacts' do
      expect(post('/contacts')).to route_to('contacts#create')
    end
    it 'get: /contacts/1' do
      expect(get('/contacts/1')).to route_to('contacts#show', id: '1')
    end
    it 'delete: /contacts/1' do
      expect(delete('/contacts/1')).to route_to('contacts#destroy', id: '1')
    end

    context 'named routes' do
      it 'get: new_contact_path' do
        expect(get(new_contact_path)).to route_to('contacts#new')
      end
      it 'get: contacts_path' do
        expect(get(contacts_path)).to route_to('contacts#index')
      end
      it 'post: contacts_path' do
        expect(post(contacts_path)).to route_to('contacts#create')
      end
      it 'get: contact_path(1)' do
        expect(get(contact_path(1))).to route_to('contacts#show', id: '1')
      end
      it 'delete: contact_path(1)' do
        expect(delete(contact_path(1))).to route_to('contacts#destroy', id: '1')
      end
    end
  end
end
