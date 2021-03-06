# OsuAuth

This project is a rails engine that provides user creation, roles, and permissions. It also provides authentication
with omniauth-shibboleth (https://github.com/toyokazu/omniauth-shibboleth) and authorization with pundit 
(https://github.com/elabs/pundit).

## Installing

To install, run the provided generator:

`bundle exec rails g osu_auth:install`

then run the migrations:

`bundle exec rake db:migrate`

This will do the following:
* Sets up the tables you need
* Creates an initializer here: config/initializers/osu_auth.rb for defining permissions
* Creates an omniauth initializer
* Adds pundit policies under app/policies
* Mounts the engine at /admin

## Routes

This will mount at /admin, and gives you the following paths:
 
 * /admin/users 
 * /admin/roles
 * /auth/shibboleth (production authentication)
 * /auth/developer (development authentication)
 * /admin/logout

## Permissions

Permissions are defined in code as so in the osu_auth.rb initializer:

```
  OsuAuth::Permission.config do
    [{name: :perm1, description: 'permission one'}]
  end
```

The symbol, :perm1 in this case is what gets checked to see if a user can perform an action. Permissions are assigned
to roles through the grants table, and roles can be assigned to users.

## Super admins

There is a super_admin boolean flag on users. If this is set to true the user can bypass all 
permissions. HANDLE WITH CARE. This is meant for developers, and grants access to administrative type things
such as masquerading. There are some rake tasks to help you manage this flag:

* `rake osu_auth:admins` lists outs all of the users with the super_admin flag set to true
* `rake osu_auth:add_admin name_n=buckeye.1` sets the super_admin flag to true for buckeye.1 (user must exist first)
* `rake osu_auth:remove_admin name_n=buckeye.1` sets the super_admin flag to false for buckeye.1


## Masquerading

This feature lets you log in with another user. If you are a super admin (see above), just visit /admin/users and
click the "login" link next to the user you wish to login as. When finished visit /admin/logout to destroy the session.


## Extending models or controllers

The ability to extend model or controllers exists by adding an appropriate decorator in your app.
For example to extend the user model, you would add a decorator here `app/decorators/models/osu_auth/user_decorator.rb`
and reopen the class using `class_eval`. For example, the user decorator would look something like this:

```
OsuAuth::User.class_eval do
  attr_accessor :example
  def hello_world
    'Hello World'
  end
  def self.greetings
    'Greetings!'
  end
end
```

Also, if you would like to have the OsuAuth controllers inherit a different controller other than your
application's ApplicationController, this can be set in the osu_auth initializer as well:

```
OsuAuth.application_controller_class = 'AdminController'
```

## API Authentication (Token Auth)

You must either define the :administer_tokens permission or be a super admin to use this. Once this
is defined, you should be able to see a tab on the user edit page called "API Token". On this
Page you can generate a token for this user. Next you will want to add the ability to authenticate to a controller.
To do this, add the following:

```
include OsuAuth::AuthenticateToken
```

This will now prevent access to the controller methods without the use of the token. You should be able to 
pass a token with something like this:

```
$ curl -IH "Authorization: Token token=a47a8e54b11c4de5a4a351734c80a14a" http://localhost:3000/episodes
```

This feature was inspired by this blog post: 
https://www.codeschool.com/blog/2014/02/03/token-based-authentication-rails/
