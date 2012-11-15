Loja::Application.routes.draw do

  root to: 'static_pages#home'

  match '/escrita', to: 'static_pages#escrita'
 
end
