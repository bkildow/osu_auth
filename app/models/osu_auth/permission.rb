module OsuAuth
  require 'active_hash'
  class Permission < ActiveHash::Base

    field :name
    field :description

    def self.config
      perms = [{name: :edit_user, description: 'can edit users'}]
      config = block_given? ? yield : []
      raise 'Permissions must be an array' unless config.respond_to? :<<
      self.data = perms + config
    end

  end
end
