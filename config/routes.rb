Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
 
  resources :faqs
  devise_for :users

  namespace :admin do
    devise_for :users 
    resources :users, only: %i[index create edit update destroy]
  end

  resources :users, only: %i[index show]
  
  root "pages#index"
  get 'pages/contact'
end
