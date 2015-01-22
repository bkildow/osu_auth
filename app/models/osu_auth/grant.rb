module OsuAuth
  class Grant < ActiveRecord::Base
    belongs_to :role
    validates :role_id, :permission, presence: true

  end
end
