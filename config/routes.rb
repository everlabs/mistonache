Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'
  get 'pro_che' => 'welcome#pro_che'

  get '/events/place/:place_id', to: 'events#place_id'

  resources :announcements, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :galleries, only: :show
  resources :events, only: [:index, :show]
end
