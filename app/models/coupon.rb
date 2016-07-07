class Coupon < ActiveRecord::Base
	has_many :user_order, :dependent => :destroy
	#has_many :coupon, :dependent => :destroy
	has_many :used_coupons
end
