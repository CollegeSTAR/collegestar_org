require 'spec_helper'

RSpec.describe UdlModuleHistoryController do
  describe 'module history routes' do
    it 'get: /profiles/1/module-history' do
      expect(get('/profiles/1/module-history')).to route_to('udl_module_history#index', profile_id: '1')
    end
    it 'get: /profiles/1/module-history/1' do
      expect(get('profiles/1/module-history/1')).to route_to('udl_module_history#show', profile_id: '1', id: '1')
    end

    context 'named routes' do
      it 'get: profile_module_history_index_path(1)' do
        expect(get(profile_module_history_index_path(1))).to route_to('udl_module_history#index', profile_id: '1')
      end
      it 'get: profile_module_path(1,1)' do
        expect(get(profile_module_history_path(1,1))).to route_to('udl_module_history#show', profile_id: '1', id: '1')
      end
    end
  end
end
