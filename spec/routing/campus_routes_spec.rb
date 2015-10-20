require 'spec_helper'

RSpec.describe CampusesController do
  describe 'campus routes' do
    it 'get: /campuses' do
      expect(get('/campuses')).to route_to('campuses#index')
    end
    it 'post: /campuses' do
      expect(post('/campuses')).to route_to('campuses#create')
    end
    it 'get: /campuses/new' do
      expect(get('/campuses/new')).to route_to('campuses#new')
    end
    it 'get: /campuses/test-campus' do
      expect(get('/campuses/test-campus')).to route_to('campuses#show', slug: 'test-campus')
    end
    it 'get: /campuses/test-campus/edit' do
      expect(get('/campuses/test-campus/edit')).to route_to('campuses#edit', slug: 'test-campus')
    end
    it 'patch: /campuses/test-campus' do
      expect(patch('/campuses/test-campus')).to route_to('campuses#update', slug: 'test-campus')
    end
    it 'put: /campuses/test-campus' do
      expect(put('/campuses/test-campus')).to route_to('campuses#update', slug: 'test-campus')
    end
    it 'delete: /campuses/test-campus' do
      expect(delete('/campuses/test-campus')).to route_to('campuses#destroy', slug: 'test-campus')
    end

    context 'named routes' do
      it 'get: campuses_path' do
        expect(get(campuses_path)).to route_to('campuses#index')
      end
      it 'post: campuses_path' do
        expect(post(campuses_path)).to route_to('campuses#create')
      end
      it 'get: new_campus_path' do
        expect(get(new_campus_path)).to route_to('campuses#new')
      end
      it 'get: campus_path(test-campus)' do
        expect(get(campus_path('test-campus'))).to route_to('campuses#show', slug: 'test-campus')
      end
      it 'get: edit_campus_path(test-campus)' do
        expect(get(edit_campus_path('test-campus'))).to route_to('campuses#edit', slug: 'test-campus')
      end
      it 'patch: campus_path(test-campus)' do
        expect(patch(campus_path('test-campus'))).to route_to('campuses#update', slug: 'test-campus')
      end
      it 'put: campus_path(test-campus)' do
        expect(put(campus_path('test-campus'))).to route_to('campuses#update', slug: 'test-campus')
      end
      it 'delete: campus_path(test-campus)' do
        expect(delete(campus_path('test-campus'))).to route_to('campuses#destroy', slug: 'test-campus')
      end
    end
  end
end
