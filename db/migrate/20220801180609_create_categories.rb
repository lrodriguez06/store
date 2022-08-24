class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :clave, limit: 10, null:false
      t.string :nombre, limit: 70, null:false
      t.boolean :activa, default: 1

      t.timestamps
    end
  end
end
