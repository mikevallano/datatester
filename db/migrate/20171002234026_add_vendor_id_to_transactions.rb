class AddVendorIdToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :vendor, foreign_key: true
  end
end
