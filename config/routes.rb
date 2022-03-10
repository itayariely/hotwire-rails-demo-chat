Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  resources :messages #, only: [:index]
  resources :users#, only: [:index]
  get 'tags/:tag', to: 'messages#index', as: :tag
  # root to: "rooms#index"
  root to: "homepage#index"
end
