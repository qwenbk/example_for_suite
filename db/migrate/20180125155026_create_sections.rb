class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :kind, null: false
      t.string :comment
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
