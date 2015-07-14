module OsuAuth
  class User < ActiveRecord::Base

    has_many :roles, through: :role_memberships
    has_many :role_memberships, dependent: :destroy

    validates :name_n, presence: true
    validates :name_n, uniqueness: true

    attr_accessor :permissions

    def display_name
      [first_name, last_name].join(' ')
    end

    # Checks to see if the user has permission
    def can?(permission)
      permissions.include?(permission.to_s) || super_admin?
    end

    def update_token
      token = SecureRandom.uuid.gsub(/\-/,'')
      update(auth_token: token)
    end

    def delete_token
      update(auth_token: nil)
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
      auth_user =  find_by_emplid(emplid: auth_hash[:emplid]) || find_by_name_n(name_n: auth_hash[:name_n])

      # Create a new record if one doesn't exist
      auth_user = new if auth_user.blank?

      auth_user.attributes = auth_hash
      auth_user.save

      auth_user
    end

    def self.find_by_emplid(emplid: '')
      where(emplid: emplid).where.not(emplid: nil).first
    end

    def self.find_by_name_n(name_n: '')
      where(name_n: name_n).where.not(name_n: nil).first
    end

  end
end
