class JsonsController < ApplicationController
  require 'osu_auth/authenticate_token'
  include OsuAuth::AuthenticateToken

  def index
    render json: ['hello world'], status: 200
  end
end

