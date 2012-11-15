Loja::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
 

  #root to: 'static_pages#home'
  #get 'static_pages/home'
  match "/static_pages/home" => "static_pages#home", :as => :root

  match '/escrita', to: 'static_pages#escrita'
  match '/pesquisa', to: 'users#search'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
 
end
