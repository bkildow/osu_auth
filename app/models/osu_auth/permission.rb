module OsuAuth
  class Permission < ActiveHash::Base

    field :name
    field :description

    def self.config
      perms = {name: :edit_user, description: 'can edit users'}
      config = block_given? ? yield : []
      self.data = config << perms
    end

  end
end
