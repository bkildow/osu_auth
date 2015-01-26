module OsuAuth
  module ControllerHelpers

    extend ActiveSupport::Concern

    included do
      attr_accessor :current_user
      helper_method :current_user
    end

    protected

    def current_user
      @current_user ||= User.find_by(emplid: emplid)
    end

    def authenticate_user!
      unless current_user
         if Rails.env.production?
           redirect_to '/'
         else
           redirect_to '/'
         end
      end
    end

    def emplid
      request.env['omniauth.auth'] && request.env['omniauth.auth']['uid']
    end
  end
end
