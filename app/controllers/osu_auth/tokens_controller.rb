require_dependency 'osu_auth/application_controller'

module OsuAuth
  class TokensController < ApplicationController
    before_action :set_user

    def show
    end

    def create
      @user.create_token
    end

    def destroy
      @user.delete_token
    end

    private

    def set_user
      @user = User.find(params[:id])
      # authorize :token
    end
  end
end
