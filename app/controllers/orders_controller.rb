class OrdersController < ApplicationController
	before_filter :set_cart_for_checkout

	def index
		#binding.pry
		@user_order = UserOrder.where(user_id:current_user.id).first
		@order_details = @user_order.order.order_details	
	end

	def new
		@order = Order.new
	end

	def create		
		@order = Order.create
		@cart_products.each do |product, value|
			@order_detail = OrderDetail.create(order:@order, product:product, 
			quantity:value["quantity"], amount:value["total_price"])		
		end
		#binding.pry
		@billing_address = Address.find(params[:billing])		
		@shipping_address = Address.find(params[:Shipping])
		@coupon_id = session[:coupon].present? ? session[:coupon].id : nil
		@user_order = UserOrder.create( user_id:current_user.id, order:@order, billing_address:@billing_address, shipping_address:@shipping_address, total_amount:@total, coupon_id:@coupon_id )


		redirect_to orders_path
	end
end
