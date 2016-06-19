class HomeController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@products = Product.all
  	@categories = Category.where(parent_id: nil)
  end
end
	