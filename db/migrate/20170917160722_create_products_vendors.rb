class CreateProductsVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :products_vendors do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :vendor, foreign_key: true

      t.timestamps
    end
  end
end
