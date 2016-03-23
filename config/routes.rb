Rails.application.routes.draw do
  root 'statics#index'

  namespace :admin do
    root 'application#index'
    resources :blogs, except: :show
  end

  resources :blogs, only: [:show, :index]

  devise_for :users
end
