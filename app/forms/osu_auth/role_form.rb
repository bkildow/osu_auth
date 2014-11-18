module OsuAuth
  require 'virtus'
  class RoleForm
    include Virtus.model

    include ActiveModel::Model

    attribute :name, String
    attribute :permissions, Hash, default: Permission.permissions

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
      # @user = @company.users.create!(name: name, email: email)
    end
  end
end
