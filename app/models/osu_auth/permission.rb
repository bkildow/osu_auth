module OsuAuth
  class Permission < ActiveRecord::Base

    belongs_to :role

    def self.config
      perms = {edit_user: 'can edit users'}
      config = block_given? ? yield(perms) : {}
      @permissions = perms.merge(config)
    end

    def self.permissions
      @permissions
    end

  end
end
