class AddImageFieldToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :image, :string
  end
end
