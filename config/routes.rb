Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  root 'main#home', as: :root
  get 'home' => 'main#home', as: :home
  get 'about' => 'main#about', as: :about
  get 'students' => 'main#students', as: :students
  get 'students/stepp-program' => 'main#stepp_program', as: :stepp_program
  get 'faculty' => 'main#faculty', as: :faculty
  get 'terms' => 'main#terms', as: :terms
  get 'supporters' => 'main#supporters'
  get 'partners' => 'main#partners'
  get 'contact-us' => 'contacts#new', as: :new_contact
  get 'signup' => 'users#new', as: :signup
  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :logout

 
  namespace :api do
    namespace :v1 do
      namespace :faculty do
        resources :redesign_summary_attachments, only: [:new, :create, :destroy], path: '/redesign-summary-attachments'
      end
      resources :sendgrid_events, only: [:create], path: 'sendgrid-events'
      resources :udl_module_feedback, only: [:create], path: 'module-feedback'
    end
  end
  
  resource :virtual_conference, only: [:show],
           path: '/virtual-conference'
  resources :virtual_conference_proposals, only: [:new, :create, :index, :show],
            path: '/virtual-conference-proposals'
  resources :virtual_conference_proposal_confirmations, 
            only: [:show],
            path: '/virtual-conference-proposal-confirmation', 
            param: :token
  resources :virtual_conference_registrations, only: [:new, :create, :index, :show],
            path: '/virtual-conference-registrations'
  resources :virtual_conference_registration_confirmations, 
            only: [:show],
            path: '/virtual-conference-registration-confirmation', 
            param: :token
  namespace :virtual_conference, path: 'virtual-conference' do
    resources :sessions, param: :slug
    get 'toolkit' => 'toolkit#show'
  end
  resources :blueprints, param: :slug
  resources :campuses, param: :slug do
    resources :faculty_nomination_surveys, path: '/faculty-nomination-surveys' do
      member do
        get 'confirmation'
      end
    end
    resources :institutional_administrators, path: '/administrators'
    resources :institutional_colleges, param: :slug, path: '/colleges' do
      resources :institutional_departments, param: :slug, path: '/departments'
    end
  end
  resources :case_study_proposals, path: '/case-study-proposals'
  resources :contacts, only: [:index, :show, :create, :destroy]
  resources :dss_contacts, param: :slug, path: '/disability-support-offices'
  resources :events, param: :slug
  resources :frequently_asked_questions, except: [:show], path: '/frequently-asked-questions'
  namespace :faculty do
    resources :redesign_summaries, except: [:create, :new], path: '/redesign-summaries'
  end
  resources :modules, param: :slug, controller: :udl_modules, as: :udl_modules do
    resource :assessment, only: [ :show, :edit, :update]
    resources :sections, except: [:show, :index], param: :slug, controller: :udl_module_sections, as: :sections
    resources :udl_module_surveys, only: [:index, :show, :new, :create], path: '/feedback-surveys' do
      resource :survey_confirmation, only: [:show], controller: :udl_module_survey_confirmations, path: '/confirmation'
    end
  end
  resources :news, except: :new, param: :slug, controller: :news_articles, as: :news_articles
  resources :news_articles, only: [:new], path: '/news-articles'
  namespace :news_letters, path: 'news-letters' do
    resource :subscriptions, only: [:new, :create]
  end
  resources :pages, param: :slug
  resources :password_resets, except: [:index, :show], path: '/password-resets'
  resources :profiles, only: [:edit, :show], controller: :users, as: :profiles do
    resources :redesign_summaries, except: [:show], path: '/redesign-summaries'
    resources :udl_modules, controller: :udl_modules_dashboard, path: '/modules-dashboard'
    resources :user_module_history, only: [:index, :show], controller: :user_module_history, path: '/module-history' do
      resources :assessments, only: [:show], controller: :user_module_assessments
    end
  end
  resource :publication, only: [:show], path: '/publications-and-resources'
  resources :sessions, only: [:create, :destroy]
  resources :shared_module_sections, except: [:show, :index], param: :slug, controller: :shared_module_sections, path: '/shared-module-sections'
  resources :student_support_programs, param: :slug, path: '/student-support-programs'
  resource :student_support_summit, only: [:show], path: '/student-support-summit' do
    resources :media_consents, only: [:new, :create, :index, :show], path: '/media-consents'
    resources :questionnaires, controller: :student_support_summit_questionnaires, only: [:new, :create, :index, :show], path: '/questionnaires'
    resources :registrations, controller: :student_support_summit_registrations
  end
  resources :surveys, param: :slug
  resources :think_udl_podcast, param: :slug, path: '/think-udl-podcast'
  resources :three_two_one_videos, param: :slug, path: '/three-two-one-videos'
  namespace :three_two_one_videos, path: '/three-two-one-videos' do
    resources :proposals
    resources :proposal_confirmations, path: 'proposal-confirmations', only: [ :show], param: :token
  end
  resources :universal_design_for_learning, param: :slug, path: '/universal-design-for-learning'
  resources :users, only: [:index, :new, :create, :update, :destroy] do
    resources :password_updates, only: [:create]
  end
  resources :user_module_assessments, only: [:show, :create], path: '/user-module-assessments'

  #get '/star-learning-communities', to: 'star_learning_communities#show'
  namespace :star_learning_communities, path: '/star-learning-communities' do
    resources :registrations
  end
   
  # Legacy site redirects
    get 'students/project-stepp', to: redirect('/students/stepp-program')

  # The original modules had a "coded" naming convention, this was a really bad idea for SEO.
  # we need to 301 redirect these old module url's to the new naming scheme

  # The following modules are not released on the new site and need to be redirected back to
  # their original implementations:
  [ 'clae', 'cq', 'crs', 'csi', 'gam', 'lsp', 'pse', 
    'qrc', 'uosc', 'ibl', 'wle','wln', 'wra' ].each do |legacy_url|
    get "/modules/#{legacy_url}", to: redirect("http://legacy.collegestar.org/modules/#{legacy_url}/introduction")
    get "/modules/#{legacy_url}/:page", to: redirect("http://legacy.collegestar.org/modules/#{legacy_url}/%{page}")
  end

  # The following modules do have a new module name and need to be redirected within
  # the rails app.

  get '/modules/aopsl', to: redirect('/modules/advance-organizers')
  get '/modules/aopsl/:page', to: redirect('/modules/advance-organizers#%{page}')
  get '/modules/col', to: redirect('/modules/cooperative-learning')
  get '/modules/col/:page', to: redirect('/modules/cooperative-learning#%{page}')
  get '/modules/fc', to: redirect('/modules/flipped-classroom')
  get '/modules/fc/:page', to: redirect('/modules/flipped-classroom#%{page}')
  get '/modules/lc', to: redirect('/modules/lecture-capture')
  get '/modules/lc/:page', to: redirect('/modules/lecture-capture#%{page}')
  get '/modules/mdi', to: redirect('/modules/mnemonic-devices-for-instruction')
  get '/modules/mdi/:page', to: redirect('/modules/mnemonic-devices-for-instruction#%{page}')
  get '/modules/pw', to: redirect('/modules/pedagogy-wheel')
  get '/modules/pw/:page', to: redirect('/modules/pedagogy-wheeli#%{page}')
  get '/modules/rwg', to: redirect('/modules/read-write')
  get '/modules/rwg/:page', to: redirect('/modules/read-write#%{page}')
  get '/modules/usoc', to: redirect('/modules/using-syllabi-to-organize-courses')
  get '/modules/usoc/:page', to: redirect('/modules/using-syllabi-to-organize-courses#%{page}')
  get '/module-proposals/new', to: redirect('/case-study-proposals/new')
end
