Rails.application.routes.draw do
  root "sessions#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show] do
    resources :shops, only: [:show]
  end

  resources :shops do
    resources :shirts, shallow: true
  end

  resources :shirts
end
