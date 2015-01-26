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

    def self.omniauth(auth_hash)
      # Search by emplid id first, and if that doesn't exist see if name_n does
      auth_user = find_by(emplid: auth_hash[:uid]) || find_by(name_n: auth_hash[:info][:name_n])

      # Create a new record if one doesn't exist. Otherwise, update the existing record
      if auth_user.blank? then
        create(auth_hash[:info])
      else
        auth_user.update_attributes(auth_hash[:info])
        auth_user
      end
    end

  end
end
