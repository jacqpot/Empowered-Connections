Rails.application.routes.draw do
  get 'connections/create'
  resources :application, only: [:show] 
   
    resources :connections do 
      resources :person_of_interests, only: [:new, :create, :show]
    end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'application#show'
end
