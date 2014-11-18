module OsuAuth
  class Permission < ActiveRecord::Base

    def self.config
      perms = {edit_user: 'can edit users'}
      config = block_given? ? yield(perms) : {}
      @permissions = perms.merge(config)
    end

    def self.permissions
      config if @permissions.nil?
      @permissions
    end

  end
end
