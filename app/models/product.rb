class Product < ActiveRecord::Base
	has_many :product_categories
    has_many :categories, :through => :product_categories
    has_many :product_images, :dependent => :destroy
    has_many :carts
end
