Rails.application.routes.draw do
  root 'statics#index'
  get 'statics/about' => 'statics#about', as: 'about', path: '/about'

  namespace :admin do
    root 'application#index'
    resources :blogs, except: :show
    resources :users, except: :show
  end

  resources :users, only: :show
  resources :blogs, only: [:show, :index]

  devise_for :users
end
