Rails.application.routes.draw do
  devise_for :users
  # resources :order_details
  # resources :orders
  # resources :customers
  # resources :carts
  # resources :products
  # resources :categories
  # devise_for :users
  # resources :banners
  # root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/home", to:"home#index"
  get "/productos/buscar", to: "products#buscador", as: "buscar_producto"
  get "/productos/:id/agregar_carrito/", to: "products#agregar_carrito", as: "agregar_carrito" 
  get "/carrito/:id/vaciar_carrito", to: "carts#vaciar_carrito", as: "vaciar_carrito"
  get "/productos/:id/disminuye_cantidad", to: "products#disminuye_cantidad", as: "disminuye_cantidad"
  get "/productos/:id/aumenta_cantidad", to: "products#aumenta_cantidad", as: "aumenta_cantidad"
  get "/customer/:id/valida_cliente", to:"customers#valida_cliente", as: "valida_cliente"
  get "/order/:id/pedido", to: "orders#genera_pedido", as: "genera_orden"
  #esto me da error, no aparece pagina de error genera_pedido, rebota el boton.con un usuario nuevo
  get "/order/:id/confirma", to: "orders#confirma_pedido", as: "confirma_pedido"

  namespace :paypal do
    resources :checkouts, only: [:create] do
      collection do
        get :complete
      end
    end
  end
end
