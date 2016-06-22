class HomeController < ApplicationController
	#before_action :authenticate_admin!
  def index  	
  	@products = Product.all 
  	session[:product_id] ||= []	
  end

  def login
  end
end
	
