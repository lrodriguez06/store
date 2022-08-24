class RemoveCodigoFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :codigo, :string
  end
end
