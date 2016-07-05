class OrdersController < ApplicationController

	def new
		@order = Order.new
	end

	def create
		#binding.pry
		@order = Order.create
		@cart_products.each do |product, value|
		@order_detail = OrderDetail.create(order:@order, product_id:product, quantity:value["quantity"], amount:value["total_price"])

		end

		redirect_to root_path
	end
end
