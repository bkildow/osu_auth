module OsuAuth
  require 'active_hash'
  class Permission < ActiveHash::Base

    field :name
    field :description

    self.data = [{name: :edit_user, description: 'can edit users'}]

    def self.config
      config = block_given? ? yield : []
      raise 'Permissions must be an array' unless config.respond_to? :<<
      self.data += config
    end

  end
end
