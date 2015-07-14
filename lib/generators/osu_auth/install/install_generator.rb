module OsuAuth
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install
      # run 'bundle install'
      route "mount OsuAuth::Engine => '/admin'"
      route "match '/auth/:provider/callback', to: 'osu_auth/sessions#create', via: %i[get post]"
      rake 'osu_auth:install:migrations'

      copy_file 'osu_auth.rb', 'config/initializers/osu_auth.rb'
      copy_file 'omniauth.rb', 'config/initializers/omniauth.rb'
      copy_file 'application_policy.rb', 'app/policies/application_policy.rb'
      copy_file 'user_policy.rb', 'app/policies/osu_auth/user_policy.rb'
      copy_file 'role_policy.rb', 'app/policies/osu_auth/role_policy.rb'
      copy_file 'token_policy.rb', 'app/policies/osu_auth/token_policy.rb'
    end
  end
end
