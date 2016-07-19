class OrderDetail < ActiveRecord::Base
  validates :order_id, presence: true, :numericality => true
  validates :product_id, presence: true, :numericality => true
  belongs_to :order
  belongs_to :product
end
