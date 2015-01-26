module OsuAuth
  class SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token unless Rails.env.production?

    def create
      @user = User.omniauth(auth_hash: auth_hash)
      self.current_user = @user
      redirect_to original_page
    end

    def destroy
      self.current_user = nil
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
