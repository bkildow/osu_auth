# This migration comes from osu_auth (originally 20141118155344)
class CreateOsuAuthGrants < ActiveRecord::Migration
  def change
    create_table :osu_auth_grants do |t|
      t.integer :role_id
      t.string :permission

      t.timestamps
    end
  end
end
