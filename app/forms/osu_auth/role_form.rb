module OsuAuth
  require 'virtus'
  class RoleForm
    include Virtus.model

    include ActiveModel::Model

    attribute :name, String
    attribute :permission_ids, Array, default: []

    validates :name, presence: true

    # Forms are never themselves persisted
    def persisted?
      false
    end

    def action
      'create'
    end

    def save
      if valid?
        persist!
        true
      else
        false
      end
    end

    private

    def persist!
      @role = Role.create!(name: name)

      # Strip out empty strings
      permissions = permission_ids.reject! { |c| c.empty? }

      # Save a grant per permission
      permissions.each do |p|
        @grant = Grant.create!(role_id: @role.id, permission: p)
      end

    end
  end
end
