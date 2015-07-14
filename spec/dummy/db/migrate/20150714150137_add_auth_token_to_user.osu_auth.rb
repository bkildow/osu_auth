# This migration comes from osu_auth (originally 20150714145940)
class AddAuthTokenToUser < ActiveRecord::Migration
  def change
    add_column :osu_auth_users, :auth_token, :string
  end
end
