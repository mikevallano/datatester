class Product < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  has_many :categories_products
  has_many :categories, through: :categories_products
  has_many :products_vendors
  has_many :vendors, through: :products_vendors
end
