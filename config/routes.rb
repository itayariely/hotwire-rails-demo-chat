Rails.application.routes.draw do
  resources :notes
  resources :tasks
  resources :releases
  resources :rooms do
    resources :messages
  end
  resources :messages #, only: [:index]
  resources :menu, only: [:index]
  resources :users#, only: [:index]
  get 'tags/:tag', to: 'messages#index', as: :tag
  resources :homepage , only: [:embed, :test] do
    collection do
      get :embed #, :defaults => { :format => 'js' }
      get :test
    end
  end
  # root to: "rooms#index"
  root to: "homepage#index"
end
