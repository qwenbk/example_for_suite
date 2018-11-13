class CreateSourses < ActiveRecord::Migration[5.1]
  def change
    create_table :sourses do |t|
      t.integer :value, null: false
      t.string :kind, null: false
      t.string :number, null: false
      t.string :comment
      t.string :kind1, null: false
      t.date :date_of, null: false
      t.references :reason, foreign_key: true

      t.timestamps
    end
  end
end
