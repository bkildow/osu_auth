module OsuAuth
  require 'active_hash'
  class Permission < ActiveHash::Base

    field :name
    field :description

    self.data = [
        {name: :add_user, description: 'Can add users'},
        {name: :view_users, description: 'Can view user lists'},
        {name: :edit_user, description: 'Can edit users'},
        {name: :delete_user, description: 'Can delete users'},
        {name: :view_roles, description: 'Can view role lists'},
        {name: :add_role, description: 'Can add roles'},
        {name: :edit_role, description: 'Can edit roles'},
        {name: :delete_role, description: 'Can delete roles'}
    ]

    def self.config
      config = block_given? ? yield : []
      raise 'Permissions must be an array' unless config.respond_to? :<<
      self.data += config
    end

  end
end
