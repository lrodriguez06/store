class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :fecha, null: false
      t.integer :folio, null: false
      t.references :customer, null: false, foreign_key: true
      t.integer :estatus, default: 1
      t.decimal :total

      t.timestamps
    end
  end
end
