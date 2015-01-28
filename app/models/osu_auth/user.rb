module OsuAuth
  class User < ActiveRecord::Base

    has_many :roles, through: :role_memberships
    has_many :role_memberships

    validates :name_n, presence: true
    validates :name_n, uniqueness: true

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
      auth_user =  find_by_emplid_or_name_n(emplid: auth_hash[:emplid], name_n: auth_hash[:name_n])

      # Create a new record if one doesn't exist
      auth_user = new if auth_user.blank?

      auth_user.attributes = auth_hash
      auth_user.save

      auth_user
    end

    # Finds users by emplid with fallback to name_n.
    # Returns nil on no matching record or if both emplid and name_n are empty
    # Doesn't match null fields
    def self.find_by_emplid_or_name_n(emplid: '', name_n: '')
      return find_by(emplid: emplid) if emplid.present?
      return find_by(name_n: name_n) if name_n.present?
      nil
    end

  end
end
