class CreateOsuAuthRoleMemberships < ActiveRecord::Migration
  def change
    create_table :osu_auth_role_memberships do |t|
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
    add_index :osu_auth_role_memberships, :role_id
    add_index :osu_auth_role_memberships, :user_id
  end
end
