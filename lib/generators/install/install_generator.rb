class InstallGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def install
    run 'bundle install'
    route "mount OsuAuth::Engine => '/admin'"
    rake 'OsuAuth:install:migrations'
    initializer 'osu_auth.rb' do
      "OsuAuth::Permission.config do
        # Return permissions hash here e.g. {perm_name: 'description'}
      end"
    end
  end
end
