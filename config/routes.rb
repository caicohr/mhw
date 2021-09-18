Rails.application.routes.draw do
  
  resources :resumes, only: [:index, :new, :create, :destroy]
  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'
  get 'resumes/destroy'
  resources :quests
  get "signup" => 'users#new'
  get "login" => 'sessions#new'
  get "logout" => 'sessions#destroy'
  get "questcalendar" => 'quests#index'
  
  get '/auth/:provider/callback', to: 'authentications#create'
  
  resources :users
  resources :sessions
  resources :groups do
    resources :posts
  end
  
  # get groups/2/posts
  
  root to: 'home#index'
  get "about" => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
