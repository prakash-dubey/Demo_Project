class AddImageToBanners < ActiveRecord::Migration
  def change
  	add_attachment :banners, :image 
  end
end
