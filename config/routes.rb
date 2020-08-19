Rails.application.routes.draw do
  get '/connections/work' => "connections#work"
  get '/connections/family' => "connections#family"
  get '/connections/church' => "connections#church"
  get '/connections/entrepenurship' => "connections#entrepenurship"
  get '/connections/friends' => "connections#friends"
  resources :application, only: [:show]  
  resources :connections do 
    resources :person_of_interests
  end
  resources :person_of_interests

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'connections#home'
end
