class Coupon < ActiveRecord::Base
	has_many :user_order, :dependent => :destroy
	has_many :user_coupon, :dependent => :destroy
end
