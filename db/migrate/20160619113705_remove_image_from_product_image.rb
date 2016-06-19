class RemoveImageFromProductImage < ActiveRecord::Migration
  def change
  	    remove_column :product_images, :image

  end
end
