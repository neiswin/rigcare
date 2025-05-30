Rails.application.routes.draw do
  # get 'equipments/index'
  # get 'equipments/show'
  # get 'equipments/new'
  # get 'equipments/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
 
  # resources :faqs do
  #   collection do
  #     post :search
  #   end
  # end
  # devise_for :users

  # namespace :admin do
  #   devise_for :users 
  #   resources :users, only: %i[index create edit update destroy]
  # end

  # resources :users, only: %i[index show]

  # get 'tags/search', to: 'tags#search'

  # post 'search', to: 'search#index', as: 'search'
  
  # post 'search/suggestions', to: 'search#suggestions', as: 'search_suggestions'



  
  # root "pages#index"

  # get '/test', to: 'tests#index'

  # resources :tests
  # get 'phonebook/', to: 'phonebook_contacts#index'

  # resources :equipments


  # resources :phonebook_contacts, only: %i[create destroy edit index new update]





  get 'pages/contact'
  # Главная страница
  root 'pages#home'

  # Статические страницы
  get 'mudpumps',  to: 'pages#mudpumps',  as: :mudpumps   # Буровые насосы
  get 'das',       to: 'pages#das',       as: :das        # СКПБ
  get 'td',        to: 'pages#td',        as: :td         # Система верхнего привода
  get 'drawwork',  to: 'pages#drawwork',  as: :drawwork  # Лебёдка

end
