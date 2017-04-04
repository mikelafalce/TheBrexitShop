Rails.application.routes.draw do

  get 'transactions/new'

  get 'carts/show'

  root 'welcome#index'

  resources :users

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :products do
    collection do
      get 'search'
    end
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

  # resources :reviews

  # root 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
