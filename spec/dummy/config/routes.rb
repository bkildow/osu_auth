Rails.application.routes.draw do

  mount OsuAuth::Engine => '/admin'
end
