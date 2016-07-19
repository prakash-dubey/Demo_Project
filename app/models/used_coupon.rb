class UsedCoupon < ActiveRecord::Base
	validates :user_id, presence: true, :numericality => true
	validates :coupon_id, presence: true, :numericality => true
	validates :order_id, presence: true, :numericality => true
  belongs_to :user
  belongs_to :coupon
  belongs_to :order
end
