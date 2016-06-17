class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.boolean :flag
      t.text :description

      t.timestamps null: false
    end
  end
end
