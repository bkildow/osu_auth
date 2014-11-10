class CreateOsuAuthRoles < ActiveRecord::Migration
  def change
    create_table :osu_auth_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
