Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  shib_options = {
      shib_session_id_field: 'Shib-Session-ID',
      shib_application_id_field: 'Shib-Application-ID',
      debug: false
  }

  provider :shibboleth, shib_options

end
