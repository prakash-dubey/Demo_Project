class AddressesController < ApplicationController
  def index  
   	@addresses = current_user.addresses
  end

  # def show
  # 	@addresses = Address.find(params[:id])
  # end

  def new  	
  	@address = Address.new
  end

	def edit
		@address = Address.find(params[:id])	
	end

	def create
	  @address = Address.new(article_params)
		@address.user = current_user
	  if @address.save
	    redirect_to addresses_path
	  else
	    render 'new'
	  end
	end

 

	def update
	 	@address = Address.find(params[:id])		 
	  if@address.update(article_params)
	    redirect_to addresses_path
	  else
	    render 'edit'
	  end
	end
 
 	def destroy
	  @address = Address.find(params[:id])
	  @address.destroy	 
	  redirect_to addresses_path
	end

	private
	def article_params
	  params.require(:address).permit!
	end
end



