require 'spec_helper'

RSpec.describe CommunitiesController do
  describe 'community routes' do
    it 'get: /communities' do
      expect(get('/communities')).to route_to('communities#index')
    end    
    it 'post: /communities' do
      expect(post('/communities')).to route_to('communities#create')
    end
    it 'get: /communities/new' do
      expect(get('/communities/new')).to route_to('communities#new')
    end
    it 'get: /communities/test-community/edit' do
      expect(get('/communities/test-community/edit')).to route_to('communities#edit', slug: 'test-community')
    end
    it 'get: /communities/test-community' do
      expect(get('/communities/test-community')).to route_to('communities#show', slug: 'test-community')
    end
    it 'patch: /communities/test-community' do
      expect(patch('/communities/test-community')).to route_to('communities#update', slug: 'test-community')
    end
    it 'put: /communities/test-community' do
      expect(put('/communities/test-community')).to route_to('communities#update', slug: 'test-community')
    end
    it 'delete: /communities/test-community' do
      expect(delete('/communities/test-community')).to route_to('communities#destroy', slug: 'test-community')
    end

    context 'named routes' do

      it 'get: communities_path' do
        expect(get(communities_path)).to route_to('communities#index')
      end    
      it 'post: communities_path' do
        expect(post(communities_path)).to route_to('communities#create')
      end
      it 'get: new_community_path' do
        expect(get(new_community_path)).to route_to('communities#new')
      end
      it 'get: edit_communtiy_path(test-community)' do
        expect(get(edit_community_path('test-community'))).to route_to('communities#edit', slug: 'test-community')
      end
      it 'get: community_path(test-community)' do
        expect(get(community_path('test-community'))).to route_to('communities#show', slug: 'test-community')
      end
      it 'patch: community_path(test-community)' do
        expect(patch(community_path('test-community'))).to route_to('communities#update', slug: 'test-community')
      end
      it 'put: community_path(test-community)' do
        expect(put(community_path('test-community'))).to route_to('communities#update', slug: 'test-community')
      end
      it 'delete: community_path(test-community)' do
        expect(delete(community_path('test-community'))).to route_to('communities#destroy', slug: 'test-community')
      end
    end
  end
end
