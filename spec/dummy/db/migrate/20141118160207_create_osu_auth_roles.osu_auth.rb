# This migration comes from osu_auth (originally 20141110181106)
class CreateOsuAuthRoles < ActiveRecord::Migration
  def change
    create_table :osu_auth_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
