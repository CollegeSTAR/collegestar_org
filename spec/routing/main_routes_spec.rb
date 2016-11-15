require 'spec_helper'

RSpec.describe MainController do
  describe 'main routes' do
    it 'get: /' do
      expect(get('/')).to route_to('main#home')
    end
    it 'get: /home' do
      expect(get('/home')).to route_to('main#home')
    end
    it 'get: /about' do
      expect(get('/about')).to route_to('main#about')
    end
    it 'get: /students' do
      expect(get('/students')).to route_to('main#students')
    end
    it 'get: /faculty' do
      expect(get('/faculty')).to route_to('main#faculty')
    end
    it 'get: /terms'do
      expect(get('/terms')).to route_to('main#terms')
    end
    it 'get: /supporters' do
      expect(get('/supporters')).to route_to('main#supporters')
    end
    it 'get: /partners' do
      expect(get('/partners')).to route_to('main#partners')
    end

    context 'named_routes'  do
      it 'get: root_path' do
        expect(get(root_path)).to route_to('main#home')
      end
      it 'get: home_path' do
        expect(get(home_path)).to route_to('main#home')
      end
      it 'get: about_path' do
        expect(get(about_path)).to route_to('main#about')
      end
      it 'get: students_path' do
        expect(get(students_path)).to route_to('main#students')
      end
      it 'get: faculty_path' do
        expect(get(faculty_path)).to route_to('main#faculty')
      end
      it 'get: terms_path' do
        expect(get(terms_path)).to route_to('main#terms')
      end
      it 'get: supporters_path' do
        expect(get(supporters_path)).to route_to('main#supporters')
      end
      it 'get: partners_path' do
        expect(get(partners_path)).to route_to('main#partners')
      end
    end
  end
end
