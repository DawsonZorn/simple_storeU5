# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'csv'
require 'faker'
Product.destroy_all

Category.destroy_all

# read csv file in
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true) # parse data

# loop through each row in csv and create product and categories for each
products.each do |product|
  # find or create the category
  categories_name = product['category']
  category = Category.find_or_create_by(name: categories_name)

  # Creates the product with the associated category
  category.products.create(
    title: product['name'],
    price: product['price'],
    description: product['description'],
    stock_quantity: product['stock quantity'],
  )
end

puts "seeded products and categories from the CSV."
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# adds 676 prolducts to the products table
# 676.times do
#   Product.create!(
#     title: Faker::Commerce.product_name,
#     price: Faker::Commerce.price(range: 10.0..100.0), # random price between 10 and 100
#     stock_quantity: Faker::Number.between(from: 1, to: 100) # random stock between 1 and 100
#   )
# end

# puts "Seeded 676 products"
