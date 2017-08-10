Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  root "pages#home"
  get "pages/home", to: "pages#home"
  
  
  resources :goals
  resources :users, except: [:new]
  
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "login", to: "session#create"
  delete "logout", to: "sessions#destroy"


  
end
