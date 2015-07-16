require 'osu_auth/engine'
require 'osu_auth/controller_helpers'
require 'osu_auth/authenticate_token'
require 'jquery-rails'
require 'omniauth-shibboleth'
require 'pundit'
require 'decorators'

module OsuAuth
  mattr_accessor :application_controller_class

  def self.application_controller_class
    acc = @@application_controller_class || 'ApplicationController'
    acc.constantize
  end

end
