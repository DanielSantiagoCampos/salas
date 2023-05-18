Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "logins#show"
  resource :login, only: ["show", "create"]

  resources :homes, only: ["index"]
  resources :users, only: %i[index show new edit create update destroy], param: :id
  resources :tools, only: %i[index show new edit create update destroy], param: :id
end
