# OsuAuth

This project is a rails engine that provides user creation, roles, and permissions. It also provides some basic
authentication mechanisms with shibboleth.

## Installing

To install, run the provided generator:

`bundle exec rake osu_auth:install`

then run the migrations:

`bundle exec rake db:migrate`

This will install the tables needed as well as create an initializer here: config/initializers/osu_auth.rb.
This is where you can specify your permissions.

## Permissions

Permissions are defined in code as so:

```
  OsuAuth::Permission.config do
    [{name: :perm1, description: 'permission one'}]
  end
```

The symbol, :perm1 in this case is what gets checked to see if a user can perform an action. Permissions are assigned
to roles through the grants table, and roles can be assigned to users.
