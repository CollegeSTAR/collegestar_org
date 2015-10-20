require 'spec_helper'

RSpec.describe EventsController do
  describe 'event routes' do
    it 'get: /events' do
      expect(get('/events')).to route_to('events#index')
    end
    it 'post: /events' do
      expect(post('/events')).to route_to('events#create')
    end
    it 'get: /events/new' do
      expect(get('/events/new')).to route_to('events#new')
    end
    it 'get: /events/test-event/edit' do
      expect(get('/events/test-event/edit')).to route_to('events#edit', slug: 'test-event')
    end
    it 'get: /events/test-event' do
      expect(get('/events/test-event')).to route_to('events#show', slug: 'test-event')
    end
    it 'patch: /events/test-event' do
      expect(patch('/events/test-event')).to route_to('events#update', slug: 'test-event')
    end
    it 'put: /events/test-event' do
      expect(put('/events/test-event')).to route_to('events#update', slug: 'test-event')
    end
    it 'delete: /events/test-event' do
      expect(delete('/events/test-event')).to route_to('events#destroy', slug: 'test-event')
    end

    context 'named routes' do
      it 'get: events_path' do
        expect(get(events_path)).to route_to('events#index')
      end      
      it 'post: events_path' do
        expect(post(events_path)).to route_to('events#create')
      end
      it 'get: new_event_path' do
        expect(get(new_event_path)).to route_to('events#new')
      end
      it 'get: edit_event_path(test-event)' do
        expect(get(edit_event_path('test-event'))).to route_to('events#edit', slug: 'test-event')
      end      
      it 'get: event_path(test-event)' do
        expect(get(event_path('test-event'))).to route_to('events#show', slug: 'test-event')
      end
      it 'patch: event_path(test-event)' do
        expect(patch(event_path('test-event'))).to route_to('events#update', slug: 'test-event')
      end
      it 'put: event_path(test-event)' do
        expect(put(event_path('test-event'))).to route_to('events#update', slug: 'test-event')
      end
      it 'delete: event_path(test-event)' do
        expect(delete(event_path('test-event'))).to route_to('events#destroy', slug: 'test-event')
      end
    end
  end
end
