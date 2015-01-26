module OsuAuth
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install
      # run 'bundle install'
      route "mount OsuAuth::Engine => '/admin'"
      rake 'osu_auth:install:migrations'

      copy_file 'osu_auth.rb', 'config/initializers/osu_auth.rb'
      copy_file 'omniauth.rb', 'config/initializers/omniauth.rb'

    end
  end
end
