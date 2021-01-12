Rails.application.routes.draw do
  resources :shops
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
