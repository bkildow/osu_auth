module OsuAuth
  class Engine < ::Rails::Engine
    isolate_namespace OsuAuth

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    # allows us to extend our models and controllers via decorators
    # see spec/dummy/app/decorators/models/osu_auth/user_decorator as an example
    config.to_prepare do
      Decorators.register! Rails.root
    end

    initializer 'OsuAuth.load_controller_helpers' do |app|
      ActionController::Base.send :include, OsuAuth::ControllerHelpers
    end
  end
end
