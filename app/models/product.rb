class Product < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  has_many :categories_products
  has_many :categories, through: :categories_products
end
