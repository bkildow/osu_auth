class AddAuthTokenToUser < ActiveRecord::Migration
  def change
    add_column :osu_auth_users, :auth_token, :string
  end
end
