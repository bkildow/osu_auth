module OsuAuth
  class SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token unless Rails.env.production?

    def create
      user = User.omniauth(auth_hash: auth_hash)
      session[:current_user] = user.to_gid
      redirect_to original_page
    end

    def destroy
      session[:current_user] = nil
    end

    protected

    def original_page
      session['request_path'] || '/'
    end

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end
