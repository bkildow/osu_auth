Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  shib_options = {
      uid_field: 'osuid',
      info_fields: {
          name_n: lambda { |request_param| request_param.call('eppn').chomp('@osu.edu') },
          first_name: 'givenName',
          last_name: 'sn'
      },
      debug: false
  }

  provider :shibboleth, shib_options
end
