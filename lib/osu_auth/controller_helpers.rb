module OsuAuth
  module ControllerHelpers

    extend ActiveSupport::Concern

    included do
      attr_accessor :current_user
      helper_method :current_user
    end

    protected

    def authenticate_user!
      if session['user_id'].blank?
        # capture current page to redirect to later
        session['request_path'] = request.path
        redirect_to login_path
      else
        @current_user = User.find(session['user_id'])
      end
    end

    def login_path
      Rails.env.production? ? 'auth/shibboleth' : 'auth/developer'
    end

  end
end
