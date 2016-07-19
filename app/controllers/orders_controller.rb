class OrdersController < ApplicationController
	before_filter :set_cart_for_checkout

	def index
		@user_order = current_user.user_orders
		#@order_details = @user_order.order.order_details		
	end

	def show
		@order = Order.find(params[:id])
		@user_order = UserOrder.where(order_id:session[:order_id]).first
	end

	def new
		@order = Order.new
	end

	def create
		 if session[:order_id].present?
		 	binding.pry
      @order = Order.find(session[:order_id])
    	@cart_products.each do |product, value|    		
	    	@order_details = OrderDetail.find_or_initialize_by(product:product,order:@order)
	    	@order_details.quantity = value[:quantity]
	    	@order_details.amount = value[:total_price]
	    	@order_details.save	  
    		end
    	@user_order = UserOrder.find_by(order:@order,user_id:current_user.id)

    	if @user_order
    		@billing_address = Address.find(params[:billing])		
			@shipping_address = Address.find(params[:Shipping])
			@coupon_id = session[:coupon].present? ? session[:coupon]["id"] : nil
			@user_order.billing_address = @billing_address
			@user_order.shipping_address = @shipping_address 
			@user_order.total_amount = @total  
			@user_order.coupon_id = @coupon_id 
			@user_order.save
			end

			@used_coupon = UsedCoupon.find_by(order_id:@order)
			if @used_coupon
				@used_coupon.coupon_id = @coupon_id
				@used_coupon.save
			end

    else
      @order = Order.create
    end
		@order = Order.create
		@cart_products.each do |product, value|
			@order_detail = OrderDetail.create(order:@order, product:product, 
			quantity:value[:quantity], amount:value[:total_price])				
		end		
		@billing_address = Address.find(params[:billing])		
		@shipping_address = Address.find(params[:Shipping])

		if session[:coupon].present?
			@coupon = Coupon.find_by_id(session[:coupon]["id"])
			@total_amount = @order.calculate_final_total(@coupon,@total)
		else
			@total_amount = @total
		end

		@user_order = UserOrder.create( user_id:current_user.id, order:@order, billing_address:@billing_address, shipping_address:@shipping_address, total_amount:@total_amount, coupon_id:@coupon_id )
    session[:order_id] = @order.id

    if @coupon_code
    	@used_coupon = UsedCoupon.create( coupon_id:@coupon,user_id:current_user.id,order_id:@order )
    end

		redirect_to order_path(@order)
	end
end
