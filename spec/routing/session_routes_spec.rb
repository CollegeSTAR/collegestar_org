require 'spec_helper'

RSpec.describe SessionsController do
  describe 'session routes' do
    it 'get: /login' do
      expect(get('/login')).to route_to('sessions#new')
    end
    it 'get: /logout' do
      expect(get('/logout')).to route_to('sessions#destroy')
    end
    it 'post: /sessions' do
      expect(post('/sessions')).to route_to('sessions#create')
    end
    it 'delete: /sessions/1' do
      expect(delete('/sessions/1')).to route_to('sessions#destroy', id: '1')
    end
  end

  describe 'named session routes' do
    it 'get: login_path' do
      expect(get(login_path)).to route_to('sessions#new')
    end
    it 'get: logout_path' do
      expect(get(logout_path)).to route_to('sessions#destroy')
    end
    it 'post: sessions_path' do
      expect(post(sessions_path)).to route_to('sessions#create')
    end
    it 'delete: session_path(1)' do
      expect(delete(session_path(1))).to route_to('sessions#destroy', id: '1')
    end
  end
end
