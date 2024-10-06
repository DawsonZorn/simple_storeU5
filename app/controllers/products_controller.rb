class ProductsController < ApplicationController
  def index
    @products = Product.all # ensures the index loads all products in an instance variable
  end

  def show
    @product = Product.find(params[:id]) # make a show function to show actions to display individual products
  end
end
