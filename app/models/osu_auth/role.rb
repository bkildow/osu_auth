module OsuAuth
  class Role < ActiveRecord::Base
    has_many :users, through: :role_memberships
    has_many :grants
    accepts_nested_attributes_for :grants, allow_destroy: true
  end
end
