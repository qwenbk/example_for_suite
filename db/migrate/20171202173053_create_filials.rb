class CreateFilials < ActiveRecord::Migration[5.1]
  def change
    create_table :filials do |t|
      t.string :name, null: false, unique: true
      t.string :description, null: false

      t.timestamps
    end
  end
end
