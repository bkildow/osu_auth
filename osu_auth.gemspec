$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'osu_auth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'osu_auth'
  s.version     = OsuAuth::VERSION
  s.authors     = ['College of Engineering']
  s.email       = ['kildow.5@osu.edu']
  s.homepage    = 'https://code.osu.edu/ews/osu_auth'
  s.summary     = 'Rails engine that abstracts out user admin, authentication, roles, and permissions.'
  s.description = 'Rails engine that abstracts out user admin, authentication, roles, and permissions.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'jquery-rails', '~> 4.0'
  s.add_dependency 'virtus', '~> 1.0'
  s.add_dependency 'active_hash', '~> 1.4'
  s.add_dependency 'pundit', '~> 0.3'

  s.add_development_dependency 'sqlite3'
end
