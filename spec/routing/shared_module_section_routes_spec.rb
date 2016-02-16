require 'spec_helper'

RSpec.describe SharedModuleSectionsController do
  describe 'shared_module_section routes' do
    it 'post: /shared-module-sections' do
      expect(post('/shared-module-sections')).to route_to('shared_module_sections#create')
    end
    it 'get: /shared-module-sections/new' do
      expect(get('/shared-module-sections/new')).to route_to('shared_module_sections#new')
    end
    it 'get: /shared-module-sections/test-section/edit' do
      expect(get('/shared-module-sections/test-section/edit')).to route_to('shared_module_sections#edit', slug: 'test-section')
    end
    it 'patch: /shared-module-sections/test-section' do
      expect(patch('/shared-module-sections/test-section')).to route_to('shared_module_sections#update', slug: 'test-section')
    end
    it 'put: /shared-module-sections/test-section' do
      expect(put('/shared-module-sections/test-section')).to route_to('shared_module_sections#update', slug: 'test-section')
    end
    it 'delete: /shared-module-sections/test-section' do
      expect(delete('/shared-module-sections/test-section')).to route_to('shared_module_sections#destroy', slug: 'test-section')
    end

    context 'named routes' do
      it 'post: shared_module_sections_path' do
        expect(post(shared_module_sections_path(slug: 'test-section'))).to route_to('shared_module_sections#create', slug: 'test-section')
      end
      it 'get: new_shared_module_section_path' do
        expect(get(new_shared_module_section_path(slug: 'test-section'))).to route_to('shared_module_sections#new', slug: 'test-section')
      end        
      it 'get: edit_shared_module_section_path(slug: test-section)' do
        expect(get(edit_shared_module_section_path(slug: 'test-section'))).to route_to('shared_module_sections#edit', slug: 'test-section')
      end  
      it 'patch: shared_module_section_path(slug: test-section)' do
        expect(patch(shared_module_section_path(slug: 'test-section'))).to route_to('shared_module_sections#update', slug: 'test-section')
      end  
      it 'put: shared_module_section_path(slug: test-section)' do
        expect(put(shared_module_section_path(slug: 'test-section'))).to route_to('shared_module_sections#update', slug: 'test-section')
      end  
      it 'delete: shared_module_section_path(slug: test-section)' do
        expect(delete(shared_module_section_path(slug: 'test-section'))).to route_to('shared_module_sections#destroy', slug: 'test-section')
      end  
    end
  end
end
