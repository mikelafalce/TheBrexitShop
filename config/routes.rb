Rails.application.routes.draw do

  resources :reviews
  get 'transactions/new'

  get 'carts/show'

  root 'products#index'

  resources :users

  resources :products do
    resources :reviews, only: [:create, :show, :destroy]
  end

  resources :transactions, only: [:new, :create]

  resources :categories, shallow: true do
    resources :products, only: [:show, :index]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
