class Product < ApplicationRecord
  # validates the title and price and stock quantity to always be included.
  validates :title, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
end
