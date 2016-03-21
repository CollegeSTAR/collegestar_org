require 'spec_helper'

RSpec.describe ModuleProposalsController do
  describe 'ModuleProposal routes' do
    it 'get: /module-proposals' do
      expect(get('/module-proposals')).to route_to('module_proposals#index')
    end
    it 'post: /module-proposals' do
      expect(post('/module-proposals')).to route_to('module_proposals#create')
    end
    it 'get: /module-proposals/new' do
      expect(get('/module-proposals/new')).to route_to('module_proposals#new')
    end
    it 'get: /module-proposals/test-proposal' do
      expect(get('/module-proposals/1')).to route_to('module_proposals#show', id: "1")
    end
    it 'get: /module-proposals/1/edit' do
      expect(get('/module-proposals/1/edit')).to route_to('module_proposals#edit', id: "1")
    end
    it 'patch: /module-proposals/1' do
      expect(patch('/module-proposals/1')).to route_to('module_proposals#update', id: "1")
    end
    it 'put: /module-proposals/1' do
      expect(put('/module-proposals/1')).to route_to('module_proposals#update', id: "1")
    end
    it 'delete: /module-proposals/1' do
      expect(delete('/module-proposals/1')).to route_to('module_proposals#destroy', id: "1")
    end

    context 'named routes' do
      it 'get: module_proposals_path' do
        expect(get(module_proposals_path)).to route_to('module_proposals#index')
      end
      it 'post: module_proposals_path' do
        expect(post(module_proposals_path)).to route_to('module_proposals#create')
      end
      it 'get: new_module_proposals_path' do
        expect(get(new_module_proposal_path)).to route_to('module_proposals#new')
      end
      it 'get: module_proposal_path(1)' do
        expect(get(module_proposal_path('1'))).to route_to('module_proposals#show', id: "1")
      end
      it 'get: edit_module_proposal_path(1)' do
        expect(get(edit_module_proposal_path('1'))).to route_to('module_proposals#edit', id: "1")
      end
      it 'patch: module_proposal_path(1)' do
        expect(patch(module_proposal_path('1'))).to route_to('module_proposals#update', id: "1")
      end
      it 'put: module_proposal_path(1)' do
        expect(put(module_proposal_path('1'))).to route_to('module_proposals#update', id: "1")
      end
      it 'delete: module_proposal_path(1)' do
        expect(delete(module_proposal_path('1'))).to route_to('module_proposals#destroy', id: "1")
      end
    end
  end
end
