Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs, only: [:index, :create]
  resources :users, only: [:create]
  post '/login', to: 'sessions#create', as: 'login'
end
