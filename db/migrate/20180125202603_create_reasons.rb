class CreateReasons < ActiveRecord::Migration[5.1]
  def change
    create_table :reasons do |t|
      t.string :name, null: false
      t.string :kind, null: false
      t.integer :value, null: false
      t.references :line, foreign_key: true

      t.timestamps
    end
  end
end
