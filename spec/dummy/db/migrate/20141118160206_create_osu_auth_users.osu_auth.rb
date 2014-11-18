# This migration comes from osu_auth (originally 20141107150726)
class CreateOsuAuthUsers < ActiveRecord::Migration
  def change
    create_table :osu_auth_users do |t|
      t.string :name_n
      t.string :emplid
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
