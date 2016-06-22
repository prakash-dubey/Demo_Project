class AddColumnToCart < ActiveRecord::Migration
  def change
  	add_reference :carts, :user
  	add_reference :carts, :product
  end
end
