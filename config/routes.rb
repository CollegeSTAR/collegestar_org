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
  
  resources :sessions, only: [:create, :destroy]
  resources :password_resets, except: [:index, :show], path: '/password-resets'
  resources :users, only: [:index, :new, :create, :update, :destroy] do
    resources :password_updates, only: [:create]
  end
  resources :profiles, only: [:edit, :show], controller: :users, as: :profiles do
    resources :modules, only: [:index, :show], controller: :udl_module_history, as: :modules
    resources :redesign_summaries, except: [:show], path: '/redesign-summaries'
  end
  resources :pages, param: :slug
  resources :news_articles, only: [:new], path: '/news-article'
  resources :news, except: :new, param: :slug, controller: :news_articles, as: :news_articles
  resources :campuses, param: :slug do
    resources :institutional_colleges, param: :slug, path: '/colleges' do
      resources :institutional_departments, param: :slug, path: '/departments'
    end
    resources :institutional_administrators, path: '/administrators'
  end

  resources :events, param: :slug
  resources :modules, param: :slug, controller: :udl_modules, as: :udl_modules do
    resources :sections, except: [:show, :index], param: :slug, controller: :udl_module_sections, as: :sections
    resource :assessment, only: [ :show, :edit, :update]
  end

  resources :universal_design_for_learning, param: :slug, path: '/universal-design-for-learning'
  resources :frequently_asked_questions, except: [:show], path: '/frequently-asked-questions'
  resources :shared_module_sections, except: [:show, :index], param: :slug, controller: :shared_module_sections, path: '/shared-module-sections'
  resources :communities, param: :slug
  resources :contacts, only: [:index, :show, :create, :destroy]
  resources :surveys, param: :slug
  resources :module_proposals, path: '/module-proposals'
  resources :dss_contacts, param: :slug, path: '/disability-support-offices'
  namespace :faculty do
    resources :redesign_summaries, except: [:create, :new], path: '/redesign-summaries'
  end

  get '/star-learning-communities', to: 'star_learning_communities#show'
  namespace :star_learning_communities, path: '/star-learning-communities' do
    resources :registrations
  end

  namespace :api do
    namespace :v1 do
      namespace :faculty do
        resources :redesign_summary_attachments, only: [:new, :create, :destroy], path: '/redesign-summary-attachments'
      end
    end
  end
end
