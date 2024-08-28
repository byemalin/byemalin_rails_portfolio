Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#landing"

  #pages
  get "home", to: 'pages#home', as: :home
  get "about", to: 'pages#about', as: :about
  get "contact", to: 'pages#contact', as: :contact
  get "terrain", to: 'pages#terrain', as: :terrain



  resources :programming_projects
  # get "programming_projects", to: 'programming_projects#index'
  # get "programming_projects/:id", to: 'programming_projects#show'


  resources :animation_projects
  # get "animation_projects", to: 'animation_projects#index'
  # get "animation_projects/:id", to: 'animation_projects#show'

end
