Loja::Application.routes.draw do

  resources :users
 

  root to: 'static_pages#home'

  match '/escrita', to: 'static_pages#escrita'
  match '/pesquisa', to: 'users#new'
 
end
