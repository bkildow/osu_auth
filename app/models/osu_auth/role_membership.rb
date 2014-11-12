module OsuAuth
  class RoleMembership < ActiveRecord::Base
    belongs_to :user
    belongs_to :role
  end
end
