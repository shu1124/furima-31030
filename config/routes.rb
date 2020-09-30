Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  get 'items', to: 'items#calc'
end
