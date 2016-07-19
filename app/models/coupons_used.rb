class CouponsUsed < ActiveRecord::Base
	validates :user_id, presence: true, :numericality => true
	validates :order_id, presence: true, :numericality => true
	validates :coupon_id, presence: true, :numericality => true
	belongs_to :user
	belongs_to :order
	belongs_to :coupon
end
