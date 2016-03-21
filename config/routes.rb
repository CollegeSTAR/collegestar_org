Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'main#home', as: :root
  get 'home' => 'main#home', as: :home
  get 'about' => 'main#about', as: :about
  get 'students' => 'main#students', as: :students
  get 'faculty' => 'main#faculty', as: :faculty
  get 'terms' => 'main#terms', as: :terms
  get 'frequently-asked-questions' => 'main#faq', as: :faq
  get 'supporters' => 'main#supporters'
  get 'partners' => 'main#partners'
  get 'contact-us' => 'contacts#new', as: :new_contact
  get 'signup' => 'users#new', as: :signup
  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :logout

  resources :sessions, only: [:create, :destroy]
  resources :password_resets, except: [:index, :show],  path: '/password-reset'
  resources :users, only: [:index, :new, :create, :update, :destroy]
  resources :profile, only: [:edit, :show], controller: :users, as: :profile do
    resources :modules, only: [:index, :show], controller: :udl_module_history, as: :modules
  end
  resources :news_articles, only: [:new], path: '/news-article'
  resources :news, except: :new, param: :slug, controller: :news_articles, as: :news_articles
  resources :campuses, param: :slug
  resources :events, param: :slug
  resources :module_proposals, path: '/module-proposals'
  resources :modules, param: :slug, controller: :udl_modules, as: :udl_modules do
    resources :sections, except: [:show, :index], param: :slug, controller: :udl_module_sections, as: :sections
  end
  resources :shared_module_sections, except: [:show, :index], param: :slug, controller: :shared_module_sections, path: '/shared-module-sections'
  resources :communities, param: :slug
  resources :contacts, only: [:index, :show, :create, :destroy]
  resources :surveys, param: :slug
  namespace :faculty do
    resources :redesign_summaries, path: '/redesign-summaries'
  end
end
