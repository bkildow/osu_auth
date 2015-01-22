module OsuAuth
  class Grant < ActiveRecord::Base
    belongs_to :role, inverse_of: :grants

    validates :role_id, :permission, presence: true

  end
end
