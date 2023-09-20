Rails.application.routes.draw do
  resources :departamentos
  resources :produtos, only: [:update]
  get "produto/edit/:id", to: "produtos#edit", as: :edit_produto
  get "produtos/busca", to: "produtos#busca", as: :busca_produto 
  delete "produtos/:id", to: "produtos#destroy", as: :deleta_produto
  post "produtos", to: "produtos#create"
  get "produtos/new", to: "produtos#new"
  get "produtos", to: "produtos#index"
  root to: "produtos#index"
end
