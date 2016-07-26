class ProductsController < ApplicationController
  before_filter :authenticate_user!, :only =>[:add_to_cart]

  def show
  	@product = Product.find(params[:id])
  end

  def add_to_cart
  	session[:product_id] << params["id"]
    set_cart_for_checkout
    @product = Product.find(params[:id])
    flash[:success] = 'Product was successfully added.'
    render 'show'
  end

end
