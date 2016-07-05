class Order < ActiveRecord::Base
	has_many :user_orders
	has_many :user, :through => :user_orders
	has_many :used_coupons
	has_many :order_details
end
