class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :codigo, limit: 5, null: false
      t.string :nombre, limit: 50, null: false
      t.string :paterno, limit: 70, null: false
      t.string :materno, limit: 70, null: false
      t.string :rut, limit: 10, null: false
      t.string :nombre_complet
      t.string :direccion
      t.string :ciudad
      t.string :pais
      t.string :telefono, null: false
      t.string :correo, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
