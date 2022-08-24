class CreateBanners < ActiveRecord::Migration[6.1]
  def change
    create_table :banners do |t|
      t.date :fecha
      t.date :vigencia
      t.boolean :promocion
      t.string :image

      t.timestamps
    end
  end
end
