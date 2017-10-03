class VendorsController < ApplicationController
  def index
    @vendors = Vendor
               .select('vendors.id, vendors.name, count(transactions.id) as transaction_count')
               .joins(:transactions)
               .includes(:products)
               .group('vendors.id')
               .order('transaction_count desc')
  end
end
