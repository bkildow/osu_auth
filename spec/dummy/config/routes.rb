Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'osu_auth/sessions#create', via: %i[get post]
  mount OsuAuth::Engine => '/admin'
  root to: 'osu_auth/users#index'
end
