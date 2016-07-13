class WishlistsController < ApplicationController
		before_filter :authenticate_user!

	def new
		@product = Product.find(params[:product_id])	
		Wishlist.find_or_create_by(:user => current_user, :product => @product)
		redirect_to root_path
  end

	def index
		@wishlists = current_user.wishlists
	end

	def destroy	
		@wishlists = Wishlist.find(params[:id])
		@wishlists.destroy
		redirect_to wishlists_path
	end
end
