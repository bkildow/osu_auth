# This migration comes from osu_auth (originally 20150130163716)
class AddSuperAdminToOsuAuthUsers < ActiveRecord::Migration
  def change
    add_column :osu_auth_users, :super_admin, :boolean, null: false, default: false
  end
end
