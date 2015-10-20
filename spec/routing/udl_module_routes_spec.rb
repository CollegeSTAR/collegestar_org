require 'spec_helper'

RSpec.describe UdlModulesController do
  describe 'udl_module routes' do
    it 'get: /modules' do
      expect(get('/modules')).to route_to('udl_modules#index')
    end
    it 'post: /modules' do
      expect(post('/modules')).to route_to('udl_modules#create')
    end
    it 'get: /modules/new' do
      expect(get('/modules/new')).to route_to('udl_modules#new')
    end
    it 'get: /modules/test-module/edit' do
      expect(get('/modules/test-module/edit')).to route_to('udl_modules#edit', slug: 'test-module')
    end
    it 'get: /modules/test-module' do
      expect(get('/modules/test-module')).to route_to('udl_modules#show', slug: 'test-module')
    end
    it 'patch: /modules/test-module' do
      expect(patch('/modules/test-module')).to route_to('udl_modules#update', slug: 'test-module')
    end
    it 'put: /modules/test-module' do
      expect(put('/modules/test-module')).to route_to('udl_modules#update', slug: 'test-module')
    end
    it 'delete: /modules/test-module' do
      expect(delete('/modules/test-module')).to route_to('udl_modules#destroy', slug: 'test-module')
    end

    context 'named routes' do
      it 'get: udl_modules_path' do
        expect(get(udl_modules_path)).to route_to('udl_modules#index')
      end
      it 'post: udl_modules_path' do
        expect(post(udl_modules_path)).to route_to('udl_modules#create')
      end
      it 'get: new_udl_module_path' do
        expect(get(new_udl_module_path)).to route_to('udl_modules#new')
      end        
      it 'get: edit_udl_module_path(test-module)' do
        expect(get(edit_udl_module_path('test-module'))).to route_to('udl_modules#edit', slug: 'test-module')
      end  
      it 'get: udl_module_path(test-module)' do
        expect(get(udl_module_path('test-module'))).to route_to('udl_modules#show', slug: 'test-module')
      end  
      it 'patch: udl_module_path(test-module)' do
        expect(patch(udl_module_path('test-module'))).to route_to('udl_modules#update', slug: 'test-module')
      end  
      it 'put: udl_module_path(test-module)' do
        expect(put(udl_module_path('test-module'))).to route_to('udl_modules#update', slug: 'test-module')
      end  
      it 'delete: udl_module_path(test-module)' do
        expect(delete(udl_module_path('test-module'))).to route_to('udl_modules#destroy', slug: 'test-module')
      end  
    end
  end
end
