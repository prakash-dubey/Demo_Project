class Address < ActiveRecord::Base
	validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
	validates :address_1, presence: true, length: { maximum: 20 }
	validates :address_2, presence: true, length: { maximum: 20 } 
	validates :city, presence: true, length: { maximum: 10 }
	validates :country, presence: true, length: { maximum: 10 }
	validates :state, presence: true, length: { maximum: 11 }
	validates :zipcode, :numericality => true, presence: true, length: { maximum: 10 }
	belongs_to :user
	has_many  :billing_user_orders,:class_name => "UserOrder", :foreign_key => "billing_address_id"
	has_many  :shipping_user_orders,:class_name => "UserOrder", :foreign_key => "shipping_address_id"
end
