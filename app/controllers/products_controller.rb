class ProductsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  end

  def add_to_cart
  	#binding.pry
  	session[:product_id] << params["id"]
    set_cart_for_checkout
    flash[:success] = 'Product was successfully added.'
    render 'show'
  end

end
