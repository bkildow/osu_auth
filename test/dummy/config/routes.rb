Rails.application.routes.draw do

  mount OsuAuth::Engine => "/osu_auth"
end
