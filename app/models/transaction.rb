class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :vendor, counter_cache: true
end
