class CreateProductimages < ActiveRecord::Migration
  def change
    create_table :productimages do |t|
      t.string :image
      t.boolean :main
      t.string :name

      t.timestamps null: false
    end
  end
end
