module OsuAuth
  class SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token unless Rails.env.production?
    skip_before_action :authenticate_user!

    def create
      user = User.omniauth(auth_hash)
      session[:current_user] = user.to_gid.to_s
      redirect_to '/'
    end

    def destroy
      session[:current_user] = nil
      redirect_to '/'
    end

    protected

    def auth_hash
      parameters = ActionController::Parameters.new(request.env['omniauth.auth'])
      parameters.require(:info).permit(:first_name, :last_name, :name_n, :emplid, :email)
    end
  end
end
