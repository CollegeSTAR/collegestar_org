require 'spec_helper'

RSpec.describe SurveysController do
  describe 'survey routes' do
    it 'get: /surveys' do
      expect(get('/surveys')).to route_to('surveys#index')
    end
    it 'post: /surveys' do
      expect(post('/surveys')).to route_to('surveys#create')
    end
    it 'get: /surveys/new' do
      expect(get('/surveys/new')).to route_to('surveys#new')
    end
    it 'get: /surveys/test-survey/edit' do
      expect(get('/surveys/test-survey/edit')).to route_to('surveys#edit', slug: 'test-survey')
    end
    it 'get: /surveys/test-survey' do
      expect(get('/surveys/test-survey')).to route_to('surveys#show', slug: 'test-survey')
    end    
    it 'patch: /surveys/test-survey' do
      expect(patch('/surveys/test-survey')).to route_to('surveys#update', slug: 'test-survey')
    end
    it 'put: /surveys/test-survey' do
      expect(put('/surveys/test-survey')).to route_to('surveys#update', slug: 'test-survey')
    end
    it 'delete: /surveys/test-survey' do
      expect(delete('/surveys/test-survey')).to route_to('surveys#destroy', slug: 'test-survey')
    end

    context 'named routes' do
      it 'get: surveys_path' do
        expect(get(surveys_path)).to route_to('surveys#index')
      end
      it 'post: surveys_path' do
        expect(post(surveys_path)).to route_to('surveys#create')
      end
      it 'get: new_survey_path' do
        expect(get(new_survey_path)).to route_to('surveys#new')
      end
      it 'get: edit_survey_path(test-survey)' do
        expect(get('/surveys/test-survey/edit')).to route_to('surveys#edit', slug: 'test-survey')
      end
      it 'get: survey_path(test-survey)' do
        expect(get(survey_path('test-survey'))).to route_to('surveys#show', slug: 'test-survey')
      end    
      it 'patch: survey_path(test-survey)' do
        expect(patch(survey_path('test-survey'))).to route_to('surveys#update', slug: 'test-survey')
      end
      it 'put: survey_path(test-survey)' do
        expect(put(survey_path('test-survey'))).to route_to('surveys#update', slug: 'test-survey')
      end
      it 'delete: survey_path(test-survey)' do
        expect(delete(survey_path('test-survey'))).to route_to('surveys#destroy', slug: 'test-survey')
      end
    end
  end
end
