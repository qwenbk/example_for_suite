class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :year, null: false, unique: true
      t.string :comment

      t.timestamps
    end
  end
end
