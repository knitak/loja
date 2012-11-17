Loja::Application.routes.draw do

  get "shop/new"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
 

  #root to: 'static_pages#home'
  #get 'static_pages/home'
  match "/home" => "static_pages#home", :as => :root

  match '/escrita', to: 'static_pages#escrita'
  match '/pesquisa', to: 'shops#search'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
 
end
