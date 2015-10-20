require 'spec_helper'

RSpec.describe PasswordResetsController do
  describe 'password reset routes' do
    it 'post: /password-reset' do
      expect(post('/password-reset')).to route_to('password_resets#create')
    end
    it 'get: /password-reset/new' do
      expect(get('/password-reset/new')).to route_to('password_resets#new')
    end
    it 'get: /password-reset/1/edit' do
      expect(get('/password-reset/1/edit')).to route_to('password_resets#edit', id: '1')
    end
    it 'patch: /password-reset/1' do
      expect(patch('/password-reset/1')).to route_to('password_resets#update', id: '1')
    end
    it 'put: /password-reset/1' do
      expect(put('/password-reset/1')).to route_to('password_resets#update', id: '1')
    end
    it 'delete: /password-reset/1' do
      expect(delete('password-reset/1')).to route_to('password_resets#destroy' , id: '1')
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
