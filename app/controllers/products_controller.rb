class ProductsController < ApplicationController
  def index
    @products = Product.all # ensures the index loads all products in an instance variable
  end
end
