require 'spec_helper'

RSpec.describe PasswordResetsController do
  describe 'password resets routes' do
    it 'post: /password-resets' do
      expect(post('/password-resets')).to route_to('password_resets#create')
    end
    it 'get: /password-resets/new' do
      expect(get('/password-resets/new')).to route_to('password_resets#new')
    end
    it 'get: /password-resets/1/edit' do
      expect(get('/password-resets/1/edit')).to route_to('password_resets#edit', id: '1')
    end
    it 'patch: /password-resets/1' do
      expect(patch('/password-resets/1')).to route_to('password_resets#update', id: '1')
    end
    it 'put: /password-resets/1' do
      expect(put('/password-resets/1')).to route_to('password_resets#update', id: '1')
    end
    it 'delete: /password-resets/1' do
      expect(delete('password-resets/1')).to route_to('password_resets#destroy' , id: '1')
    end

    context 'named routes' do
      it 'post: password_resets_path' do
        expect(post(password_resets_path)).to route_to('password_resets#create')
      end
      it 'get: new_password_reset_path' do
        expect(get(new_password_reset_path)).to route_to('password_resets#new')
      end
      it 'get: edit_password_reset_path(1)' do
        expect(get(edit_password_reset_path(1))).to route_to('password_resets#edit', id: '1')
      end
      it 'patch: password_reset_path(1)' do
        expect(patch(password_reset_path(1))).to route_to('password_resets#update', id: '1')
      end
      it 'put: password_reset_path(1)' do
        expect(put(password_reset_path(1))).to route_to('password_resets#update', id: '1')
      end
      it 'delete: password_reset_path(1)' do
        expect(delete(password_reset_path(1))).to route_to('password_resets#destroy', id: '1')
      end
    end
  end
end
