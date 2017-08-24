Rails.application.routes.draw do
  devise_for :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
   root "pages#home"
  get "pages/home", to: "pages#home"
  
  
  resources :goals do
    resources :comments, only: [:create]
  end
  
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
  
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/edit", to: "devise/registrations#edit"
  # get "/logout", to: "devise/sessions#destroy" 

  # mount ActionCable.server => '/cable'
end
