module OsuAuth
  class Role < ActiveRecord::Base
    has_many :users, through: :role_memberships
    has_many :grants, dependent: :destroy

    # Get all permissions associated with this role
    def permission_ids
      grants.pluck(:permission) || []
    end

    # Check if a permission in associated with this role
    def has_permission?(permission)
      permission_ids.include? permission.to_s
    end

  end
end
