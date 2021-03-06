class Category < ActiveRecord::Base
	has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
	belongs_to :parent, :class_name => "Category"
	has_many :product_categories, :dependent => :destroy 
	has_many :products, :through => :product_categories , :dependent => :destroy 
end


