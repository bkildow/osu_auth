require_dependency 'osu_auth/application_controller'

module OsuAuth
  class TokensController < ApplicationController
    before_action :set_user

    def show
    end

    def update
      @user.update_token ? msg = 'Token was successfully generated' : msg = 'There was an error generating the token'
      redirect_to token_path(@user), notice: msg
    end

    def destroy
      @user.delete_token ? msg = 'Token was successfully deleted' : msg = 'There was an error deleting the token'
      redirect_to token_path(@user), notice: msg
    end

    private

    def set_user
      @user = User.find(params[:id])
      authorize Token
    end
  end
end
