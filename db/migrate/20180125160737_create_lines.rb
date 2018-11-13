class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.string :registry_number, null: false
      t.string :period, null: false
      t.string :level, null: false
      t.string :specialty, null: false
      t.string :form_of_training, null: false
      t.string :ovz, null: false
      t.float :mark, null: false
      t.boolean :verification
      t.references :section, foreign_key: true
      t.integer :recruitment
      t.integer :studying
      t.integer :release
      t.string :comment
      t.references :filial, foreign_key: true

      t.timestamps
    end
  end
end
