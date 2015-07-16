# This is currently just used to get the correct namespacing for TokenPolicy
# Pundit follows namespacing on models, so just a symbol could not be used

module OsuAuth
  class Token < ActiveRecord::Base

  end
end
