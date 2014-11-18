module OsuAuth
  class Permission < ActiveRecord::Base

    belongs_to :role

    validates :role_id, :machine_name, presence: true

    def self.config
      perms = {edit_user: 'can edit users'}
      config = block_given? ? yield(perms) : {}
      @permissions = perms.merge(config)
    end

    def self.permissions
      config if @permissions.nil?
      @permissions
    end

    def self.save_perms(role_id, permissions = [])
      # TODO: delete records for this role_id?
      permissions.each do |name|
        find_or_create_by!(machine_name: name, role_id: role_id) do |c|
          c.machine_name = name
          c.role_id = role_id
        end
      end
    end

  end
end
