TwitterClone::Application.routes.draw do
  root :to => 'users#index'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: 'sessions#new', as: 'login'
  get 'signup', to: 'users#new', as: 'signup'

  resources :users
  resources :sessions
  resources :tweets
end
