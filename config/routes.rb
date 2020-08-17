Rails.application.routes.draw do
  resources :person_of_interests
  resources :connections
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'application#show'
end
