class Vendor < ApplicationRecord
  has_many :products_vendors
  has_many :products, through: :products_vendors
end
