# OsuAuth

This project is a rails engine that provides user creation, roles, and permissions. It also provides some basic
authentication mechanisms with shibboleth.

## Installing

To install, run the provided generator:

`bundle exec rails g osu_auth:install`

then run the migrations:

`bundle exec rake db:migrate`

This will do the following:
* set up the tables you need
* create an initializer here: config/initializers/osu_auth.rb for defining permissions
* create an omniauth initializer
* mount the engine at /admin

## Routes

This will mount at /admin, and give you a path to users (/admin/users) and roles (/admin/roles).

## Permissions

Permissions are defined in code as so:

```
  OsuAuth::Permission.config do
    [{name: :perm1, description: 'permission one'}]
  end
```

The symbol, :perm1 in this case is what gets checked to see if a user can perform an action. Permissions are assigned
to roles through the grants table, and roles can be assigned to users.
