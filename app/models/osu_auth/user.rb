module OsuAuth
  class User < ActiveRecord::Base

    has_many :roles, through: :role_memberships

    validates :first_name, :last_name, :email, :name_n, presence: true

    def display_name
      [first_name, last_name].join(' ')
    end

  end
end
