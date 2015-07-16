module OsuAuth
  module AuthenticateToken

    extend ActiveSupport::Concern

    included do
      before_action :authenticate_token
    end

    private

    def authenticate_token
      locate_token || render_unauthorized
    end

    def locate_token
      authenticate_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: 'Bad credentials', status: 401
    end

  end

end
