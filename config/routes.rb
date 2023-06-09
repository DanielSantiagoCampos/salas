Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "logins#show"
  resource :login, only: ["show", "create"]
  resource :calendar, only: ["show"]

  resources :homes, only: ["index"]
  resources :users, only: %i[index show new edit create update destroy], param: :id
  resources :tools, only: %i[index show new edit create update destroy], param: :id
  resources :donations, only: %i[index show new edit create update destroy], param: :id
  resources :reservations, only: %i[index show new edit create update destroy], param: :id
end
