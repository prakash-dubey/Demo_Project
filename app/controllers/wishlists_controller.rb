class WishlistsController < ApplicationController

	def new
		session[:product_id] << params["product_id"]
    flash[:success] = 'Product was successfully added.'
  end
	def index
	end

	def show
	end
end
