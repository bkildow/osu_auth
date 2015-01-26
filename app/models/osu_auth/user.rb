module OsuAuth
  class User < ActiveRecord::Base

    has_many :roles, through: :role_memberships
    has_many :role_memberships

    validates :first_name, :last_name, :email, :name_n, presence: true

    attr_accessor :permissions

    def display_name
      [first_name, last_name].join(' ')
    end

    # Checks to see if the user has permission
    def can?(permission)
      permissions.include? permission
    end

    # Gets an array of all available permissions across roles assigned
    def permissions
      if @permissions.nil?
        perm_array = []
        roles.each { |r| perm_array << r.permission_ids }
        @permissions = perm_array.flatten.uniq
      else
        @permissions
      end
    end

    # Finds or creates user
    def self.omniauth(auth_hash:)
      unscoped.where(emplid: auth_hash[:uid]).first_or_initialize.tap do |user|
        user.update_attributes Hash[auth_hash[:info].select { |k, _| user.respond_to? "#{k}=" }]
      end
    end

  end
end
