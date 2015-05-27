Rails.application.config.middleware.use OmniAuth::Builder do

  dev_options = {
      fields: [:name_n],
      uid_field: :name_n
  }

  provider :developer, dev_options unless Rails.env.production?

  shib_options = {
      uid_field: 'employeeNumber',
      info_fields: {
          name_n: lambda { |request_param| request_param.call('eppn').chomp('@osu.edu') },
          first_name: 'givenName',
          last_name: 'sn',
          emplid: 'employeeNumber'
      },
      debug: false
  }

  provider :shibboleth, shib_options
end
