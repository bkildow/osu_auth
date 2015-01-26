module OsuAuth
  class SessionsController < ApplicationController

    def create
      @user = User.omniauth(auth_hash: auth_hash)
      self.current_user = @user
      redirect_to '/'
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end
