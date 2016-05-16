require 'spec_helper'

RSpec.describe Faculty::ModuleProposalsController do
  describe 'ModuleProposal routes' do
    it 'get: /faculty/module-proposals' do
      expect(get('/faculty/module-proposals')).to route_to('faculty/module_proposals#index')
    end
    it 'post: /faculty/module-proposals' do
      expect(post('/faculty/module-proposals')).to route_to('faculty/module_proposals#create')
    end
    it 'get: /faculty/module-proposals/new' do
      expect(get('/faculty/module-proposals/new')).to route_to('faculty/module_proposals#new')
    end
    it 'get: /faculty/module-proposals/test-proposal' do
      expect(get('/faculty/module-proposals/1')).to route_to('faculty/module_proposals#show', id: "1")
    end
    it 'get: /faculty/module-proposals/1/edit' do
      expect(get('/faculty/module-proposals/1/edit')).to route_to('faculty/module_proposals#edit', id: "1")
    end
    it 'patch: /faculty/module-proposals/1' do
      expect(patch('/faculty/module-proposals/1')).to route_to('faculty/module_proposals#update', id: "1")
    end
    it 'put: /faculty/module-proposals/1' do
      expect(put('/faculty/module-proposals/1')).to route_to('faculty/module_proposals#update', id: "1")
    end
    it 'delete: /faculty/module-proposals/1' do
      expect(delete('/faculty/module-proposals/1')).to route_to('faculty/module_proposals#destroy', id: "1")
    end

    context 'named routes' do
      it 'get: faculty_module_proposals_path' do
        expect(get(faculty_module_proposals_path)).to route_to('faculty/module_proposals#index')
      end
      it 'post: faculty_module_proposals_path' do
        expect(post(faculty_module_proposals_path)).to route_to('faculty/module_proposals#create')
      end
      it 'get: new_faculty_module_proposals_path' do
        expect(get(new_faculty_module_proposal_path)).to route_to('faculty/module_proposals#new')
      end
      it 'get: faculty_module_proposal_path(1)' do
        expect(get(faculty_module_proposal_path('1'))).to route_to('faculty/module_proposals#show', id: "1")
      end
      it 'get: edit_faculty_module_proposal_path(1)' do
        expect(get(edit_faculty_module_proposal_path('1'))).to route_to('faculty/module_proposals#edit', id: "1")
      end
      it 'patch: faculty_module_proposal_path(1)' do
        expect(patch(faculty_module_proposal_path('1'))).to route_to('faculty/module_proposals#update', id: "1")
      end
      it 'put: faculty_module_proposal_path(1)' do
        expect(put(faculty_module_proposal_path('1'))).to route_to('faculty/module_proposals#update', id: "1")
      end
      it 'delete: faculty_module_proposal_path(1)' do
        expect(delete(faculty_module_proposal_path('1'))).to route_to('faculty/module_proposals#destroy', id: "1")
      end
    end
  end
end
