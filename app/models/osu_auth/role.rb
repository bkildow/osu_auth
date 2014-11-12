module OsuAuth
  class Role < ActiveRecord::Base
    has_many :users, through: :role_memberships
    has_many :permissions
  end
end
