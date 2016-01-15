require 'spec_helper'

RSpec.describe UdlModuleSectionsController do
  describe 'udl_module_section routes' do
    it 'get: /modules/test-module/sections' do
      expect(get('/modules/test-module/sections')).to route_to('udl_module_sections#index', udl_module_slug: 'test-module')
    end
    it 'post: /modules/test-module/sections' do
      expect(post('/modules/test-module/sections')).to route_to('udl_module_sections#create', udl_module_slug: 'test-module')
    end
    it 'get: /modules/test-module/sections/new' do
      expect(get('/modules/test-module/sections/new')).to route_to('udl_module_sections#new', udl_module_slug: 'test-module')
    end
    it 'get: /modules/test-module/sections/test-section/edit' do
      expect(get('/modules/test-module/sections/test-section/edit')).to route_to('udl_module_sections#edit', udl_module_slug: 'test-module', slug: 'test-section')
    end
    it 'patch: /modules/test-module/sections/test-section' do
      expect(patch('/modules/test-module/sections/test-section')).to route_to('udl_module_sections#update', udl_module_slug: 'test-module', slug: 'test-section')
    end
    it 'put: /modules/test-module/sections/test-section' do
      expect(put('/modules/test-module/sections/test-section')).to route_to('udl_module_sections#update', udl_module_slug: 'test-module', slug: 'test-section')
    end
    it 'delete: /modules/test-module/sections/test-section' do
      expect(delete('/modules/test-module/sections/test-section')).to route_to('udl_module_sections#destroy', udl_module_slug: 'test-module', slug: 'test-section')
    end

    context 'named routes' do
      it 'get: udl_module_sections_path' do
        expect(get(udl_module_sections_path(udl_module_slug: 'test-module'))).to route_to('udl_module_sections#index', udl_module_slug: 'test-module')
      end
      it 'post: udl_module_sections_path' do
        expect(post(udl_module_sections_path(udl_module_slug: 'test-module'))).to route_to('udl_module_sections#create', udl_module_slug: 'test-module')
      end
      it 'get: new_udl_module_section_path' do
        expect(get(new_udl_module_section_path(udl_module_slug: 'test-module'))).to route_to('udl_module_sections#new', udl_module_slug: 'test-module')
      end        
      it 'get: edit_udl_module_section_path(udl_module_slug: test-module, slug: test-section)' do
        expect(get(edit_udl_module_section_path(udl_module_slug: 'test-module', slug: 'test-section'))).to route_to('udl_module_sections#edit', udl_module_slug: 'test-module', slug: 'test-section')
      end  
      it 'patch: udl_module_section_path(udl_module_slug: test-module, slug: test-section)' do
        expect(patch(udl_module_section_path(udl_module_slug: 'test-module', slug: 'test-section'))).to route_to('udl_module_sections#update', udl_module_slug: 'test-module', slug: 'test-section')
      end  
      it 'put: udl_module_section_path(udl_module_slug: test-module, slug: test-section)' do
        expect(put(udl_module_section_path(udl_module_slug: 'test-module', slug: 'test-section'))).to route_to('udl_module_sections#update', udl_module_slug: 'test-module', slug: 'test-section')
      end  
      it 'delete: udl_module_section_path(udl_module_slug: test-module, slug: test-section)' do
        expect(delete(udl_module_section_path(udl_module_slug: 'test-module', slug: 'test-section'))).to route_to('udl_module_sections#destroy', udl_module_slug: 'test-module', slug: 'test-section')
      end  
    end
  end

end
