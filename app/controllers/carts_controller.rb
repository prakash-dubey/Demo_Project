class CartsController < ApplicationController
  before_filter :authenticate_user!, :only =>[:checkout]

	def show    
    @quantities = {}
    @uniq_prods = session[:product_id].uniq
    @uniq_prods.each do |i| 
      @quantities[i] =  session[:product_id].count(i) 

    end
    @cart_products = {}
    @quantities.each do |k,v|

      product=Product.find(k)
      @cart_products[product]={"quantity": v,"total_price": v * product.price}
    end
    @total=0

  end

  def new
    add_product_to_cart
    redirect_to root_path
  end

  def add_product_to_cart
    session[:product_id] << params["product_id"]
    flash[:success] = 'Product was successfully added.' 
  end

  def add_product
  	add_product_to_cart
    redirect_to user_carts_path    
  end


  def reduce_product
  	#binding.pry
  	@session = session[:product_id]
  	session[:product_id].delete_at( @session.index(params[:product_id] ))
    flash[:success] = 'Product was successfully removed.'
    redirect_to user_carts_path	
  end

  def remove_product
    session[:product_id].delete(params[:product_id])
    flash[:success] = 'Product was successfully removed.'  
    redirect_to user_carts_path
  end

  def checkout
    calculate_total
  end

  def calculate_total
    @quantities = {}
    @uniq_prods = session[:product_id].uniq
    @uniq_prods.each do |i| 
      @quantities[i] =  session[:product_id].count(i) 

    end
    @cart_products = {}
    @total=0
    @quantities.each do |k,v|
      product=Product.find(k)
      total_price = v * product.price
      @cart_products[product]={"quantity": v,"total_price": total_price}
      @total += total_price
    end
  end

  def apply_coupon
    calculate_total
    #binding.pry
     if Coupon.exists?(:code => params[:coupon])
      @coupon = Coupon.find_by(:code => params[:coupon])
      @message = "Code Valid"
       @percent = @coupon.discount_of/100
       @intermediate_total = @total * @percent
       @final_total = @total - @intermediate_total
    else
      @message = "Code Invalid"
    end
  end

end



