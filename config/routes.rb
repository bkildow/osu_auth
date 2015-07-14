OsuAuth::Engine.routes.draw do
  resources :users do
    get 'masquerade', on: :member
  end

  resources :roles
  resources :tokens, only: [:show, :create, :destroy]

  get 'logout', to: 'sessions#destroy'
end
