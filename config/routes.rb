Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'
  get 'pro-che/history' => 'welcome#history'
  get 'pro-che/video' => 'welcome#video'
  get 'pro-che/emblems' => 'welcome#emblems'
  get 'mat/repertoir/:id' => 'welcome#repertoir', as:'repertoir'
  get 'kinoshot' => 'welcome#kinoshot'
  get 'pro-che' => 'welcome#pro_che'
  get 'pro-go' => 'welcome#pro_go'
  get 'mat' => 'welcome#mat'
  get '/events/place/:place_id', to: 'events#place_id'

  resources :announcements, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :galleries, only: [:index, :show]
  resources :events, only: [:index, :show]

  get 'pro-go/announcements', to: 'announcements#go_announcements', as: 'go_announcements'
  get 'kinoshot/announcements', to: 'announcements#kinoshot_announcements', as: 'kinoshot_announcements'
  get 'mat/announcements', to: 'announcements#mat_announcements', as: 'mat_announcements'
  get 'pro-go/persons/:id', to: 'welcome#person', as: 'persons'

end
