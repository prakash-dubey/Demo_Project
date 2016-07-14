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
    #redirect_to root_path
  end

  def add_product_to_cart
    session[:product_id] << params["product_id"]
    flash[:success] = 'Product was successfully added.'
  end

  def add_product
    add_product_to_cart    
    @count = session[:product_id].count(params[:product_id])
    calculate_total
    @product = Product.find(params[:product_id])
    @total_price = @cart_products[@product][:total_price].to_i
    #redirect_to user_carts_path    
  end


  def reduce_product  
    calculate_total
    @count = session[:product_id].count(params[:product_id])
    @product = Product.find(params[:product_id])
    if @cart_products[@product]
    @total_price = @cart_products[@product][:total_price].to_i
   end
    @session = session[:product_id]
    session[:product_id].delete_at( @session.index(params[:product_id] ))
    flash[:success] = 'Product was successfully removed.'
    #redirect_to user_carts_path
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
    if params[:coupon].present?
      calculate_total
      if Coupon.exists?(:code => params[:coupon])
        @coupon = Coupon.find_by(:code => params[:coupon])
        @message = "#{@coupon.code} applied"  
        @percent = @coupon.discount_of/100
        @intermediate_total = @total * @percent
        @final_total = @total - @intermediate_total
        @discount_amount = @total - @final_total
        session[:coupon] = @coupon      
      else
        @message = "Not Valid"
      end
    else
      @message = "Please enter coupon"
    end
  end

  def remove_coupon
    session[:coupon] = ""
    calculate_total
    #redirect_to user_carts_checkout_path
  end
end