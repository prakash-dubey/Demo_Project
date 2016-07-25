class WishlistsController < ApplicationController
		before_filter :authenticate_user!

	def new
		@product = Product.find(params[:product_id])	
		Wishlist.find_or_create_by(:user => current_user, :product => @product)
		flash[:success] = 'Product successfully added in Wishlist.'
		redirect_to root_path
  end

	def index
		@wishlists = current_user.wishlists
		flash[:success] = 'You are in Wishlist.'
	end

	def destroy	
		@wishlists = Wishlist.find(params[:id])
		@wishlists.destroy
		redirect_to wishlists_path
	end
end
