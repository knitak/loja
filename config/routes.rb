Loja::Application.routes.draw do

  get "users/new"

  root to: 'static_pages#home'

  match '/escrita', to: 'static_pages#escrita'
  match '/pesquisa', to: 'users#new'
 
end
