class Order < ActiveRecord::Base
	has_many :user_orders
	has_many :users, through: :user_orders
	has_many :used_coupons
	has_many :order_details

	def calculate_final_total(coupon,total)
		percent = coupon.discount_of/100
		intermediate_total = total * percent
		final_total = total - intermediate_total
	end
end
