class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all # ensures the index loads all products in an instance variable and to prevent an N = 1 issue when loading the product with their respective category.
  end

  def show
    @product = Product.find(params[:id]) # make a show function to show actions to display individual products
  end
end
