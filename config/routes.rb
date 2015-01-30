OsuAuth::Engine.routes.draw do
  resources :users do
    get 'masquerade', on: :member
  end

  resources :roles

  get 'logout', to: 'sessions#destroy'
end
