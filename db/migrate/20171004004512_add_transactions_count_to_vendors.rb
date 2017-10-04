class AddTransactionsCountToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :transactions_count, :integer, default: 0
  end
end

# Vendor.reset_column_information
# Vendor.all.each do |v|
#   Vendor.reset_counters(v.id, :transactions)
# end
