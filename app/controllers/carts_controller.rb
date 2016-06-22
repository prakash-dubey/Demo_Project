class CartsController < ApplicationController

	def show
		#@cart = current_cart
		@product = Product.find session[:product_id]
	end

	def new
		
		# cart = Cart.find_or_initialize_by(user_id: current_user.id, product_id: params["product_id"].to_i)
		# cart.save!
		session[:product_id] << params["product_id"]		
		redirect_to root_path
	end

end
