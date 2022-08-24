class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.date :fecha
      t.integer :cantidad
      t.references :product, null: false, foreign_key: true
      t.decimal :precio
      t.boolean :pedido

      t.timestamps
    end
  end
end
