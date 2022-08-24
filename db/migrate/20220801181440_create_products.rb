class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :codigo, limit: 16, null: false
      t.string :nombre, limit: 50, null:false
      t.string :descripcion
      t.decimal :precio, null:false
      t.integer :existencia, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
