class PaymentGateway < ActiveRecord::Base
	# validates :user_order_id
  belongs_to :user_order
end
