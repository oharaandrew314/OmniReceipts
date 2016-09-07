Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'welcome', to: 'welcome#index'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :receipts do
    resources :items
  end

  root to: 'receipts#index'
end
