Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'example#testing'

  resources :pets, except: [:destroy]
  resources :people, only: [:show, :index, :new, :create]
end
