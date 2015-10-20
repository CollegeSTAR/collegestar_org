require 'spec_helper'

describe UsersController do
  it 'get: /users' do
    expect(get('/users')).to route_to('users#index')
  end
  it 'post: /users' do
    expect(post('/users')).to route_to('users#create')
  end
  it 'get: users/1' do
    expect(get('users/1')).to_not be_routable
  end
  it 'put: /users/1' do
    expect(put('/users/1')).to route_to('users#update', id: '1')
  end
  it 'patch: /users/1' do
    expect(patch('/users/1')).to route_to('users#update', id: '1')
  end
  it 'delete: /users/1' do
    expect(delete('/users/1')).to route_to('users#destroy', id: '1')
  end  
  it 'get: /users/new' do
    expect(get('/users/new')).to route_to('users#new')
  end

  context 'profile alias' do
    it 'get: /profile/1' do
      expect(get('/profile/1')).to route_to('users#show', id: '1')
    end
    it 'get: profile/1/edit' do
      expect(get('/profile/1/edit')).to route_to('users#edit', id: '1')
    end
    it 'get: /profiles' do
      expect(get('/profiles')).to_not be_routable
    end
    it 'post: /profiles' do
      expect(post('/profiles')).to_not be_routable
    end
    it 'put: /profiles/1' do
      expect(put('/profiles/1')).to_not be_routable
    end
    it 'patch: /profiles/1' do
      expect(patch('/profiles/1')).to_not be_routable
    end
    it 'delete: /profiles/1' do
      expect(delete('/profiles/1')).to_not be_routable
    end
  end

  context "signup alias" do
    it 'get: /signup' do
      expect(get('/signup')).to route_to('users#new')
    end
  end

  context 'named_routes' do
    it 'get: users_path' do
      expect(get(users_path)).to route_to('users#index')
    end
    it 'post: users_path' do
      expect(post(users_path)).to route_to('users#create')
    end
    it 'get: new_user' do
      expect(get(new_user_path)).to route_to('users#new')
    end
    it 'patch: user_path(1)' do
      expect(patch(user_path(1))).to route_to('users#update', id: '1')
    end
    it 'put: user_path(1)' do
      expect(put(user_path(1))).to route_to('users#update', id: '1')
    end
    it 'delete: user_path(1)' do
      expect(delete(user_path(1))).to route_to('users#destroy', id: '1')
    end
    it 'get: profile_path(1)' do
      expect(get(profile_path(1))).to route_to('users#show', id: '1')
    end
    it 'get: edit_profile_path' do
      expect(get(edit_profile_path(1))).to route_to('users#edit', id: '1')
    end
    it 'get: signup_path' do
      expect(get(signup_path)).to route_to('users#new')
    end
  end
end
