module OsuAuth
  class Role < ActiveRecord::Base
    has_many :users, through: :role_memberships
    has_many :permissions
    accepts_nested_attributes_for :permissions, allow_destroy: true
  end
end
