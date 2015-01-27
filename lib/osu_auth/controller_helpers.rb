module OsuAuth
  module ControllerHelpers

    extend ActiveSupport::Concern

    included do
      helper_method :current_user
      attr_accessor :current_user
    end

    private

    def authenticate_user!
      redirect_to login_path unless current_user
    end

    def login_path
      Rails.env.production? ? '/auth/shibboleth' : '/auth/developer'
    end

    def current_user
      @current_user ||= GlobalID::Locator.locate session[:current_user] if session[:current_user]
    end
  end

end
