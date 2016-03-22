Rails.application.routes.draw do
  root 'statics#index'

  namespace :admin do
  root 'application#index'
  end

  devise_for :users
end
