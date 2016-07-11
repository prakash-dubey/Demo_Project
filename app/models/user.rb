class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :addresses, :dependent => :destroy
  has_many :user_orders, :dependent => :destroy
  has_many :orders, through: :user_orders, dependent: :destroy
  has_many :coupons, :dependent => :destroy
  has_many :used_coupons
  has_many :wishlists     
end
