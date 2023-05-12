Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resource :login, only: ["show", "create"]

  resources :users, only: %i[index show new edit create update destroy], param: :id
  resources :tools, only: %i[index show new edit create update destroy], param: :id
end
