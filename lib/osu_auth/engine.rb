module OsuAuth
  class Engine < ::Rails::Engine
    isolate_namespace OsuAuth

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer 'OsuAuth.load_controller_helpers' do |app|
      ActionController::Base.send :include, OsuAuth::ControllerHelpers
    end
  end
end
