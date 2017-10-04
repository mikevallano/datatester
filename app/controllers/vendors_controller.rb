class VendorsController < ApplicationController
  def index
    @vendors = Vendor
               .select('vendors.id, vendors.name, vendors.transactions_count')
               .includes(:products)
               .group('vendors.id')
               .order('vendors.transactions_count desc')
  end
end
