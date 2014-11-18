module OsuAuth
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install
      # run 'bundle install'
      route "mount OsuAuth::Engine => '/admin'"
      rake 'osu_auth:install:migrations'
      initializer 'osu_auth.rb' do
        "OsuAuth::Permission.config do
  # Return permissions array here. Example:
  # [
  #   {name: :delete_users, description: 'can delete users'},
  #   {name: :edit_resource, description: 'can edit resources'}
  # ]
end
"
      end
    end
  end
end
