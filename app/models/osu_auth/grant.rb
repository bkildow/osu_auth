module OsuAuth
  class Grant < ActiveRecord::Base
    belongs_to :role

    validates :role_id, :machine_name, presence: true
  end
end
