class CreateRoleUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :role_users do |t|
      t.references :user, foreign_key: true, null: false
      t.references :role, foreign_key: true, null: false

      t.timestamps
    end
  end
end
