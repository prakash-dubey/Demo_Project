  class HomeController < ApplicationController
	#before_action :authenticate_admin!
  def index  	
  	@products = Product.all 
  	@banners = Banner.all
  	@products = Product.paginate(:page => params[:page], :per_page => 2)
  	session[:product_id] ||= []
  end

  def login
  end
end
	
