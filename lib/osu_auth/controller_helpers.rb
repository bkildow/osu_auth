module OsuAuth
  module ControllerHelpers

    extend ActiveSupport::Concern

    included do
      helper_method :current_user
      attr_writer :current_user
      include Pundit

      # Show an error page when action is not authorized with pundit
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    end

    private

    def authenticate_user!
      session[:osu_auth_redirect] = request.fullpath
      redirect_to login_path unless current_user
    end

    def login_path
      (Rails.env.production? || Rails.env.staging?) ? '/auth/shibboleth' : '/auth/developer'
    end

    def current_user
      @current_user ||= GlobalID::Locator.locate session[:current_user] if session[:current_user]
    end

    def user_not_authorized
      render status: :forbidden, text: 'You are not authorized to perform this action.'
    end

  end

end
