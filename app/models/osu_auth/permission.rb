module OsuAuth
  require 'active_hash'
  class Permission < ActiveHash::Base

    field :name
    field :description

    self.data = [
        {name: :add_user, description: 'can add users'},
        {name: :view_users, description: 'can view user lists'},
        {name: :edit_user, description: 'can edit users'},
        {name: :delete_user, description: 'can delete users'},
        {name: :assign_user_roles, description: 'can assign roles to users'},
        {name: :view_roles, description: 'can view role lists'},
        {name: :add_role, description: 'can add roles'},
        {name: :edit_role, description: 'can edit roles'},
        {name: :delete_role, description: 'can delete roles'},
        {name: :assign_role_permissions, description: 'can assign permissions to roles'}
    ]

    def self.config
      config = block_given? ? yield : []
      raise 'Permissions must be an array' unless config.respond_to? :<<
      self.data += config
    end

  end
end
