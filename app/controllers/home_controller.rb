class HomeController < ApplicationController
	#before_action :authenticate_admin!
  def index
  	@banners = Banner.all
  end
end
	